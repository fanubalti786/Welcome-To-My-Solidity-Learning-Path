

// we can't do that bc when we have same functions in diffrent contract and inherit one place then we must inherit both
// ❌ This contract will throw error if fun3() and fun4() are not overridden.
// ❌ But even if you override, `B` is inherited twice (via B and via C), which Solidity doesn't allow.
// ✅ So override should be done if the structure was allowed (in clean DAG format).

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

    function fun3() public pure virtual returns (string memory) {
        return "A: fun3";
    }

    function fun4() public pure virtual returns (string memory) {
        return "A: fun4";
    }
}

/// 🔹 Contract B inherits from A
contract B is A {

    constructor()
    {
        x = 150;
    }

    uint public y = 200;

    function fun3() public pure virtual override returns (string memory) {
        return "B: fun3";
    }

    function fun4() public pure virtual override returns (string memory) {
        return "B: fun4";
    }
}

/// 🔹 Contract C also inherits from A (side-branch)
contract C is B {

    constructor()
    {
        x = 200;
    }
    uint public z = 300;

    function fun3() public pure  override returns (string memory) {
        return "C: fun3";
    }

    function fun4() public pure  override returns (string memory) {
        return "C: fun4";
    }
}

/// 🔹 Contract D inherits from both B and C (Multiple Inheritance)
contract D is B, C {
    /*
        ❗ Conflict Resolution:
        - fun3() & fun4() are present in both B and C
        - You MUST override them again in D to resolve ambiguity

        ✅ Right-to-left rule: `C` is the rightmost parent,
           so `C`'s implementation will be used unless overridden
    */

    
    // // 🔸 Final override (no further virtual)
    // function fun3() public pure override(B, C) returns (string memory) {
    //     return "D: fun3";
    // }

    // // 🔸 Final override (no further virtual)
    // function fun4() public pure override(B, C) returns (string memory) {
    //     return "D: fun4";
    // }

    // 🔸 Access functions from various levels
    function getX() public view returns (uint) {
        return x; // From A
    }

    function getY() public view returns (uint) {
        return y; // From B
    }

    function getZ() public view returns (uint) {
        return z; // From C
    }

    function allFuncs() public pure returns (
    string memory f1,
    string memory f2,
    string memory f3A,
    string memory f3B,
    string memory f3C,
    string memory f3D,
    string memory f4A,
    string memory f4B,
    string memory f4C,
    string memory f4D
) {
    // From A
    f1 = A.fun1();
    f2 = A.fun2();

    // fun3 from each contract
    f3A = A.fun3(); // "A: fun3"
    f3B = B.fun3(); // "B: fun3"
    f3C = C.fun3(); // "C: fun3"
    // f3D = D.fun3(); // "D: fun3" — final override

    // fun4 from each contract
    f4A = A.fun4(); // "A: fun4"
    f4B = B.fun4(); // "B: fun4"
    f4C = C.fun4(); // "C: fun4"
    // f4D = D.fun4(); // "D: fun4" — final override

}
}
