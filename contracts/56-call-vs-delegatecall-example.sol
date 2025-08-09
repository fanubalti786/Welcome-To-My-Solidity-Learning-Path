// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Logic {
    uint public x;

    // Payable function
    function setX(uint _x) public payable {
        x = _x;
    }

    // Non-payable function
    function setXSimple(uint _x) public {
        x = _x;
    }
}

contract Caller {
    // 1️⃣ Payable function call using `.call` with gas limit and Ether forwarding
    function callSetXPayable(address logicAddr, uint _x) public payable {
        (bool success, ) = logicAddr.call{gas: 50000, value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", _x)
        );
        require(success, "Call failed");
    }

    // 2️⃣ Non-payable function call using `.delegatecall` with gas limit
    function delegatecallSetXSimple(address logicAddr, uint _x) public {
        (bool success, ) = logicAddr.delegatecall{gas: 50000}(
            abi.encodeWithSignature("setXSimple(uint256)", _x)
        );
        require(success, "Delegatecall failed");
    }
}
