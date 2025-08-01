// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedArrayExample {
    uint[5] public fixedArray; // Fixed-size array of 5 elements, initialized to [0,0,0,0,0]
    // uint[] public myArray = [1, 2, 3]; // ✅ Allowed
    uint[] public myArray;
    // myArray.push(5); // ❌ Error: statement is not allowed at global level



    // ✅ Set/Update value at specific index
    function set(uint index, uint value) public {
        require(index < fixedArray.length, "Index out of bounds");
        fixedArray[index] = value;
    }

    // ✅ Get value at specific index
    function get(uint index) public view returns (uint) {
        require(index < fixedArray.length, "Index out of bounds");
        return fixedArray[index];
    }

    // ✅ Delete value at index (resets to default = 0, doesn't remove element)
    function reset(uint index) public {
        require(index < fixedArray.length, "Index out of bounds");
        delete fixedArray[index];
    }

    // ✅ Get full array (returns [5] memory)
    function getAll() public view returns (uint[5] memory) {
        return fixedArray;
    }

    // ✅ Get length (always 5 for this array)
    function length() public view returns (uint) {
        return fixedArray.length;
    }

    // ✅ Set all elements at once by passing array [5]
    function setAll(uint[5] memory values) public {
        fixedArray = values;
    }

    // ✅ Reset entire array to default (all 0)
    function resetAll() public {
        for (uint i = 0; i < fixedArray.length; i++) {
            delete fixedArray[i];
        }
    }

    /*
    ❌ NOT ALLOWED IN FIXED-SIZE ARRAY:

    function push(uint value) public {
        // fixedArray.push(value); // ❌ Compile Error: push is not supported on fixed-size arrays
    }

    function pop() public {
        // fixedArray.pop(); // ❌ Compile Error: pop is not supported on fixed-size arrays
    }

    function removeLast() public {
        // ❌ You cannot reduce size of a fixed array
    }

    function dynamicResize() public {
        // fixedArray.length = 2; // ❌ Not allowed: length cannot be changed
    }
    */
}
