// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
  File: AbiEncodeDecodeDetailed.sol

  Is contract ka maqsad:
  - input calldata (abi.encodeWithSignature / encodeWithSelector / encodeCall) kaise banta hai dikhana
  - input calldata ko decode karna (selector skip kar ke) dikhana
  - dynamic low-level call karke raw return bytes lena aur unko decode karna dikhana
  - comments me clear rules diye gaye hain ke kab selector hota hai aur kab skip karna hai
*/

interface IERC20 {
    function transfer(address, uint256) external returns (bool);
}

contract AbiEncodeDecodeDetailed {
    /* -----------------------------------------------------------
       Simple example function to call (used for demonstration)
       -----------------------------------------------------------
       add(a,b) returns a+b
       - Agar aap is function ko low-level call se call karoge to
         return data me sirf encoded return value aayegi (selector nahi).
    */
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    /* -----------------------------------------------------------
       1) Encode helpers (create calldata bytes)
       -----------------------------------------------------------
       - encodeWithSignature: signature string par kaam karta hai.
         Typo possible hai kyunki string compile-time check nahi hota.
       - encodeWithSelector: function selector (4 bytes) + arguments.
         Selector ko interface ke selector se lena safe hota hai.
       - encodeCall: compile-time checked, type-safe, recommended.
    */
    function getEncoded_withSignature(uint256 a, uint256 b) public pure returns (bytes memory) {
        // Result: [4 bytes selector] + [32 bytes a] + [32 bytes b]
        // NOTE: signature string ko galat likh do to calldata ban jayega lekin
        // target contract expected signature se match nahi karega => call fail karega.
        return abi.encodeWithSignature("add(uint256,uint256)", a, b);
    }

    function getEncoded_withSelector(uint256 a, uint256 b) public pure returns (bytes memory) {
        // Using this contract's add selector explicitly.
        // IERC20.transfer.selector type pattern demo ke liye aap interfaces me bhi use karte ho.
        bytes4 sel = this.add.selector; // same as bytes4(keccak256("add(uint256,uint256)"))[0:4]
        return abi.encodeWithSelector(sel, a, b);
    }

    function getEncoded_withEncodeCall(uint256 a, uint256 b) public pure returns (bytes memory) {
        // encodeCall is type-checked at compile time. Agar signature mismatch hogi to compile-time error.
        return abi.encodeCall(this.add, (a, b));
    }

    /* -----------------------------------------------------------
       2) Decoding input bytes (manually encoded calldata)
       -----------------------------------------------------------
       - IMPORTANT: Manually encoded calldata (jo abi.encodeWithSignature ya encodeWithSelector
         produce karte hain) ke start me 4 bytes selector hota hai.
       - Agar aap parameters wapas chahte ho to selector ko skip karo: data[4:]
       - Example usage:
         bytes memory calldata = getEncoded_withSignature(2,3);
         (uint256 x, uint256 y) = decodeInputParams(calldata); // returns (2,3)
    */
    function decodeInputParams(bytes calldata data) public pure returns (uint256 x, uint256 y) {
        // data format: [4 bytes selector][32 bytes a][32 bytes b]
        // abi.decode expects only encoded arguments, so we give it data after the first 4 bytes.
        // Agar aap data se selector nahi hataoge to decode galat ho jayega.
        require(data.length >= 4 + 32 + 32, "data too short");
        (x, y) = abi.decode(data[4:], (uint256, uint256));
    }

    /* -----------------------------------------------------------
       3) Low-level call example and decoding RETURN value
       -----------------------------------------------------------
       - Jab aap call(...) karte ho to EVM function execute karta hai aur jo return hota hai
         woh 'return data' bytes me aata hai. Return data me **koi selector nahi hota**,
         sirf encoded return values hote hain.
       - Isliye RETURN data ko decode karne ke liye aap direct abi.decode(data, (...)) use kar saktay ho.
    */
    function callAddAndGetRaw(uint256 a, uint256 b) public returns (bytes memory) {
        // Use encodeCall (type-checked) to produce calldata, then low-level call to this contract.
        (bool ok, bytes memory ret) = address(this).call(abi.encodeCall(this.add, (a, b)));
        require(ok, "call to add failed");
        // ret contains only encoded return values: [32 bytes result]
        return ret;
    }

    function decodeReturnValue(bytes calldata returnData) public pure returns (uint256 result) {
        // Return data DOES NOT include a selector, so direct decode is correct.
        require(returnData.length >= 32, "returnData too short");
        result = abi.decode(returnData, (uint256));
    }

    /* -----------------------------------------------------------
       4) Full round-trip helpers (encode -> call -> decode)
       -----------------------------------------------------------
       - Useful to test in Remix: these functions show full flow and include comments.
    */
    function roundTrip_withSignature(uint256 a, uint256 b) public returns (uint256) {
        // 1) build calldata (has selector)
        bytes memory calldataBytes = abi.encodeWithSignature("add(uint256,uint256)", a, b);

        // 2) low-level call
        (bool ok, bytes memory ret) = address(this).call(calldataBytes);
        require(ok, "call failed");

        // 3) decode return (no selector in return)
        uint256 sum = abi.decode(ret, (uint256));
        return sum;
    }

    function roundTrip_manualDecodeInput(bytes calldata manualCalldata) public pure returns (uint256 a, uint256 b) {
        // If the caller constructs calldata off-chain and pastes it here,
        // we can decode its parameters by skipping the 4-byte selector.
        (a, b) = abi.decode(manualCalldata[4:], (uint256, uint256));
    }

    /* -----------------------------------------------------------
       5) Quick helper: show hex-length checks (safety)
       -----------------------------------------------------------
       - These checks help you avoid accidental underflows/overflows when slicing bytes.
    */
    function safeDecodeInput(bytes calldata data) public pure returns (uint256 a, uint256 b) {
        // required length = 4 bytes selector + 32 bytes a + 32 bytes b = 68 bytes
        require(data.length == 4 + 32 + 32, "unexpected calldata length");
        (a, b) = abi.decode(data[4:], (uint256, uint256));
    }
}
