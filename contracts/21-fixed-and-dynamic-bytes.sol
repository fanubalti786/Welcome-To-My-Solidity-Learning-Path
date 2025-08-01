// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract bytesDeclaration {
    // 🔹 State-level declarations 🔹

    // ✅ Fixed-size value type (stored directly) — NO memory keyword needed
    bytes1 public fixedByte1 = 0xAA;
    bytes4 public fixedByte4 = 0x12345678;
    bytes32 public fixedByte32;

    // ✅ Dynamic-size reference type — Stored in storage — memory not needed here
    bytes public dynamicBytes1 = "Hello";
    bytes public dynamicBytes2;

    function bytesInFunction(uint256 len) public pure returns (bytes memory, bytes1) {
        // 🔸 Fixed-size value type — No memory needed
        bytes1 b1 = 0xFF;

        // 🔸 Dynamic bytes — Reference type — MUST use memory
        bytes memory dyn1 = new bytes(len); // ✅ OK

        // ❌ Error: memory keyword is required
        // bytes dyn2 = new bytes(len); // ❌ Invalid: Data location must be "memory"

        return (dyn1, b1);
    }

    function bytesStorageReference() public view returns (bytes memory, bytes1) {
        // 🔸 Memory copy of state dynamic bytes — Required memory keyword
        bytes memory tempCopy = dynamicBytes1;

        // 🔸 Fixed bytes — direct value return
        bytes1 val = fixedByte1;

        return (tempCopy, val);
    }

    function deleteBytesExamples() public {
        // ✅ Delete fixed-size value type (sets to 0x00)
        delete fixedByte1;

        // ✅ Delete dynamic bytes (clears content)
        delete dynamicBytes1;
    }
}
