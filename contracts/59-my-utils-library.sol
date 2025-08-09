// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//////////////////////////////////////////////////////////////
// 📌 Single Multi-Purpose Library: MyUtils
//////////////////////////////////////////////////////////////
library MyUtils {
    // 🧮 Math Example
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }

    // 🔍 String Length Example
    function length(string memory str) internal pure returns (uint) {
        return bytes(str).length;
    }

    // 🔄 Array Search Example (memory array)
    function contains(uint[] memory arr, uint value) internal pure returns (bool) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == value) {
                return true;
            }
        }
        return false;
    }

    // 🗑️ Array Remove Element by Index (storage array)
    function remove(uint256[] storage arr, uint256 index) internal {
        require(arr.length > 0, "Can't remove from empty array");
        require(index < arr.length, "Index out of bounds");

        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

//////////////////////////////////////////////////////////////
// 📌 Contract 1: Math, String, Array Search Examples
//////////////////////////////////////////////////////////////
contract TestLibrary {
    using MyUtils for uint;
    using MyUtils for string;
    using MyUtils for uint[];
    using MyUtils for uint256[]; // for remove function

    uint[] public myNumbers;

    // ➕ Example 1: uint ke saath library ka use
    function sumNumbers(uint a, uint b) public pure returns (uint) {
        return a.add(b);
    }

    // 🔍 Example 2: string ke saath library ka use
    function getStringLength(string memory name) public pure returns (uint) {
        return name.length();
    }

    // 🔄 Example 3: array search ka use
    function addNumber(uint num) public {
        myNumbers.push(num);
    }

    function checkNumberExists(uint num) public view returns (bool) {
        return myNumbers.contains(num);
    }

    // 🗑️ Example 4: array se element remove karna
    function removeNumber(uint index) public {
        myNumbers.remove(index);
    }

    // Helper to get array
    function getNumbers() public view returns (uint[] memory) {
        return myNumbers;
    }
}
