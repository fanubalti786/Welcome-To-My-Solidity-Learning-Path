// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// 🔹 Base Contract A
contract A {
    uint public x = 100;

    function fun1() public pure returns (string memory) {
        return "A: fun1";
    }

    function fun2() public pure returns (string memory) {
        return "A: fun2";
    }

    // virtual = allow child override
    function fun3() public pure virtual returns (string memory) {
        return "A: fun3";
    }

    function fun4() public pure virtual returns (string memory) {
        return "A: fun4";
    }
}

/// 🔹 B inherits A
contract B is A {
    uint public y = 200;

    function fun3() public pure virtual override returns (string memory) {
        return "B: fun3";
    }

    function fun4() public pure virtual override returns (string memory) {
        return "B: fun4";
    }
}

/// 🔹 C inherits A
contract C is A {
    uint public z = 300;

    function fun3() public pure virtual override returns (string memory) {
        return "C: fun3";
    }

    function fun4() public pure virtual override returns (string memory) {
        return "C: fun4";
    }
}

/// 🔹 D inherits B and C (Multiple Inheritance)
contract D is B, C {

    /*
        ❗ fun3 & fun4 conflict:
        B + C dono ne override kiya hai
        👉 isliye D ko dubara override karna zaroori hai
    */

    // Final override
    function fun3() public pure override(B, C) returns (string memory) {
        return "D: fun3";
    }

    function fun4() public pure override(B, C) returns (string memory) {
        return "D: fun4";
    }

    // Access state vars
    function getAllValues() public view returns (uint, uint, uint) {
        return (x, y, z); // from A, B, C
    }
}
