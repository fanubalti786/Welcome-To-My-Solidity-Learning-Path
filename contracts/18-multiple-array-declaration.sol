// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract arrayDeclaration {
    // fixed arrays
    uint256[] public fixedArray14 = [1, 2, 3];
    uint256[3] public fixedArray1 = [1, 2, 3];
    uint256[5] public fixedArray2;
    uint256[] public fixedArray3 = new uint256[](3);

    // dynamic arrays
    uint256[] public dynamicArray1 = [1, 2, 3];
    uint256[] public dynamicArray2;

    function arrayDeclarationInFunction(uint256 len) public {
        // fixed array
        uint256[5] memory memoryArray1;


        // ❌ Inline memory array initialization is NOT allowed like this
        // ✅ You must assign values one by one in memory fixed arrays
        // uint256[3] memory memoryArray2 = [1, 2, 3]; //❌ Invalid syntax in memory


        uint256[] memory memoryArray3 = new uint256[](3);


        // Len parameter se length define ho rahi hai (dynamic initialization)
        // but its not a actuall dynamic
        uint256[] memory temp = new uint256[](len);



        // dynamic array in funcion is not allowed
    }

    function arrayTypesExample(uint256 len) public view {
        // 🔸 Storage reference (points to state array, allows direct modification)
        uint256[3] storage refArray = fixedArray1; // State array ka reference

        // 🔸 Memory copy of state array (read-only, changes do not affect original)
        uint256[3] memory copyArray = fixedArray1; // State array ka snapshot (clone)
    }
}
