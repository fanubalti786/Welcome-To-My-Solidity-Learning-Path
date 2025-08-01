// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferenceAssign {
    string public name = "Irfan";

    // Valid
    function copyToMemory() public view returns (string memory) {
        string memory temp = name;
        return temp;
    }

    // ❌ Invalid: Cannot assign storage ref to string directly in function
    // function invalidStorageAssign() public view returns (string memory) {
    //     string storage temp = name; // ❌ Error
    //     return temp;
    // }
}



/*
Reference Type | Allowed in Functions | Notes
-----------------------------------------------------
struct         | memory ✅, storage ✅   | full access
array          | memory ✅, storage ✅   | full access
mapping        | storage ✅ only        | cannot be used in memory
string         | memory ✅, storage ❌   | use memory only in functions
bytes          | memory ✅, storage ❌   | same as string
*/
