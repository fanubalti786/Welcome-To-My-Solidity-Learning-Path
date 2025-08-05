// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierFlowDemo {
    address public owner;
    string public result;

    constructor() {
        owner = msg.sender;
    }

    // ✅ Modifier with pre & post logic — and full explanation
    modifier onlyOwner() {
        // 🔹 Step 1: Logic BEFORE the function runs
        result = "Modifier Start";

        // 🔹 Step 2: This is where the actual function body is injected
        _;

        // 🔹 Step 3: Logic AFTER the function has run
        result = string.concat(result, " -> Modifier End");

        // 🔴 ❌ INVALID:
        // _;  
        // ❗ERROR: Multiple `_` statements are not allowed in a modifier.
        // ❗Reason: Solidity only supports one function injection point per modifier.
    }

    // ✅ Function 1
    function doSomething1() public onlyOwner {
        result = string.concat(result, " -> Function 1");
    }

    // ✅ Function 2
    function doSomething2() public onlyOwner {
        result = string.concat(result, " -> Function 2");
    }

    // ✅ Function 3
    function doSomething3() public onlyOwner {
        result = string.concat(result, " -> Function 3");
    }

    // ✅ Function 4
    function doSomething4() public onlyOwner {
        result = string.concat(result, " -> Function 4");
    }
}
