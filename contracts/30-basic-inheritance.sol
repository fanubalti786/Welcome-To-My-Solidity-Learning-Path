// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 🔹 Parent Contract
contract A {
    uint public x = 100;

    function getX() public view returns (uint) {
        return x;
    }

    function greet() public pure virtual returns (string memory) {
        return "Hello from A";
    }
}

// 🔹 Child Contract
contract B is A {
    uint public y = 200;

    function getY() public view returns (uint) {
        return y;
    }

    // 🔸 Function override
    function greet() public pure override returns (string memory) {
        return "Hello from B";
    }

    function getBothValues() public view returns (uint, uint) {
        return (x, y); // 🔸 Accessing inherited state var
    }
}
