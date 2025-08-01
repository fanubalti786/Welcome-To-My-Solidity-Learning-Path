// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArrayMaster {
    uint256[] public dynamicArray;

    // ✅ Add new value (at end)
    function add(uint256 value) public {
        dynamicArray.push(value);
    }

    // ✅ Set/Update value at specific index
    function set(uint256 index, uint256 value) public {
        require(index < dynamicArray.length, "Index out of bound");
        dynamicArray[index] = value;
    }

    // ❌ Direct index insert not allowed like: dynamicArray[10] = 99;
    // Reason: Only existing indexes can be updated.
    // To add a value at new index, use `push()` to grow array.

    // ✅ Get value at specific index
    function get(uint256 index) public view returns (uint256) {
        require(index < dynamicArray.length, "Index out of bound");
        return dynamicArray[index];
    }

    // ✅ Get entire array
    function getAll() public view returns (uint[] memory) {
        return dynamicArray;
    }

    // ✅ Get array length
    function length() public view returns (uint256) {
        return dynamicArray.length;
    }

    // ✅ Delete value at index (resets to 0, doesn't remove index)
    function reset(uint256 index) public {
        require(index < dynamicArray.length, "index out of bounds");
        delete dynamicArray[index];
    }

    // ✅ Reset all values to 0 (length remains same)
    function resetAll() public {
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            delete dynamicArray[i];
        }
    }

    // ✅ Remove last element (pop): permanently removes last index
    function removeLast() public {
        require(dynamicArray.length > 0, "Array is empty");
        dynamicArray.pop();
    }

    // ✅ Clear entire array (length becomes 0, all indexes gone)
    function clearArray() public {
        delete dynamicArray;
    }
}
