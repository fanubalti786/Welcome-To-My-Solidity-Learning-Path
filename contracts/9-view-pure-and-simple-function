// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8;

contract viewAndPureFunction {
    uint256 public age = 20;

    // 2️⃣ View Function
    // ✅ Can read state
    // ❌ Cannot write state
    // ✅ Must return something

    function View1() public view returns (uint256) {
        return age;
    }

    function View2() public view returns (uint256) {
        return age + 20;
    }


    // 3️⃣ Pure Function
    // ❌ Cannot read or write state
    // ✅ Must return something
    // 🧠 Only uses inputs or local variables

    function Pure1() public pure returns (uint256) {
        return 10;
    }

    function Pure2(uint256 _x) public pure returns (uint256) {
        return _x;
    }


    // 1️⃣ Simple Function (no modifier)
    // ✅ Can read & write state variables
    // ❌ Return is optional
    // ⚙️ Used when you change state

    function Simple() public {
        age += 1;
    }
}
