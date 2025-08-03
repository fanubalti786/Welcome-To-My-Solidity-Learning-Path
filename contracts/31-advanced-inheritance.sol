// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint public x = 1;
    string private secret = "Hidden A";

    function greet() public pure virtual returns (string memory) {
        return "From A";
    }

    function showSecret() internal view returns (string memory) {
        return secret;
    }
}

contract B is A {
    uint public x = 2; // 🔸 Hides A.x but does not override (not allowed in Solidity)

    function greet() public pure virtual override returns (string memory) {
        return "From B";
    }

    function showBoth() public view returns (uint, string memory) {
        return (A.x, showSecret()); // ✅ A.x is accessed explicitly, secret via internal
    }
}

contract C is B {
    function greet() public pure override returns (string memory) {
        return "From C";
    }

    function fullCheck() public view returns (uint, uint, string memory, string memory) {
        uint xFromA = A.x(); // ❌ Not allowed directly like a class, can't call like that
        uint xFromThis = this.x(); // ✅ Returns B.x, which hides A.x
        uint xDirect = x; // ✅ Refers to B.x
        string memory greetFrom = greet(); // ✅ C.greet()

        return (xFromThis, xDirect, greetFrom, showSecret());
    }
}
