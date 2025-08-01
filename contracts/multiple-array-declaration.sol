// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract arrayDeclaration {

    uint[] public stateArray; // Yeh function ke bahar declared hoti hai


   function arrayTypesExample(uint len) public view {
    uint[] memory newArr = new uint[](3);

    // Len parameter se length define ho rahi hai (dynamic initialization)
    // but its not a actuall dynamic 
    uint[] memory temp = new uint[](len);



     // 🔸 Local fixed array (stack level — mostly for small types like uint[3])
    uint[3] memory fixedArray = [uint(1), 2, 3]; // Fixed-length memory array


    // 🔸 Storage reference (points to state array, allows direct modification)
    uint[] storage refArray = stateArray; // State array ka reference

    // 🔸 Memory copy of state array (read-only, changes do not affect original)
    uint[] memory copyArray = stateArray; // State array ka snapshot (clone)

   
}
}