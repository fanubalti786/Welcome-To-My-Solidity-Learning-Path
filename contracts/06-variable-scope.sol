// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableScope {
    uint public stateVar = 100; // State

    function testScope() public pure returns (uint) {
        uint localVar = 50; // Local
        return localVar;
    }
}
