// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title constant vs immutable demo with gas explanation
contract ConstAndImmutableDemo {

    // ----------------------------------------
    // ✅ CONSTANTS: Assigned at compile-time only
    // ----------------------------------------

    // ❗ Must be hardcoded — cannot use dynamic/global values like msg.sender or block.timestamp
    uint public constant TAX_RATE = 10;
    string public constant SYMBOL = "IRF";
    address public constant DEAD_WALLET = 0x000000000000000000000000000000000000dEaD;

    // ❌ Not allowed — would cause compiler error:
    // address public constant CREATOR = msg.sender;
    // uint public constant CREATED_AT = block.timestamp;

    // ----------------------------------------
    // ✅ IMMUTABLES: Assigned once at deployment (constructor or inline)
    // ----------------------------------------

    address public immutable contractOwner;       // assigned at runtime
    uint public immutable deploymentTime;

    // ✅ Allowed: static value
    uint public immutable STATIC_ID = 999;

    // ❌ Not allowed inline — would cause compiler error:
    // address public immutable CREATOR = msg.sender;         // ❌ Error
    // uint public immutable CREATED_AT = block.timestamp;    // ❌ Error

    constructor() {
        contractOwner = msg.sender;
        deploymentTime = block.timestamp;
    }

    // ----------------------------------------
    // 🔍 Example usage
    // ----------------------------------------

    function calculateTax(uint amount) public pure returns (uint) {
        return (amount * TAX_RATE) / 100;
    }

    function contractAge() public view returns (uint) {
        return block.timestamp - deploymentTime;
    }

    function onlyOwnerAction() public view returns (string memory) {
        require(msg.sender == contractOwner, " Not the contract owner");
        return " You are the contract owner!";
    }
}
