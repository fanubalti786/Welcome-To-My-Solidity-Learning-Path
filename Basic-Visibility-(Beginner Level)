// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 🔹 Basic Visibility Demo: Testing access *within the same contract*
contract BasicVisibility {
    // 🔸 State Variables
    uint public pubVar = 1;        // ✅ Accessible everywhere via getter
    uint internal intVar = 2;      // ✅ Accessible inside and by child
    uint private privVar = 3;      // ✅ Only accessible inside this contract

    // 🔸 Functions
    function publicFunction() public pure returns (string memory) {
        return "Public function called";
    }

    function internalFunction() internal pure returns (string memory) {
        return "Internal function called";
    }

    function privateFunction() private pure returns (string memory) {
        return "Private function called";
    }

    function externalFunction() external pure returns (string memory) {
        return "External function called";
    }

    // 🔸 Testing internal access
    function testInternalAccess() public view returns (
        uint, uint, uint,
        string memory, string memory, string memory
    ) {
        return (
            pubVar,        // ✅
            intVar,        // ✅
            privVar,       // ✅
            publicFunction(),   // ✅
            internalFunction(), // ✅
            privateFunction()   // ✅
            // externalFunction() ❌ Not allowed internally
        );
    }
}
