// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract _string
{
    string public str = "yaseen";

    function checkString1(string memory _name) public pure returns(string memory)
    {   
        // string name = _name; Error
        // string storage name = _name; Error
        string memory name = _name;
        return name;
    }


    function checkString2(string memory _name) public 
    {   
        // string name = _name; Error
        // string storage name = _name; Error
        str = _name;
    }
     
}


_stateVar (str) → storage
_name → memory

Memory → Memory        ✅ allowed
Memory → Storage       ✅ allowed
Storage → Memory       ✅ allowed
Storage → Storage*     ❌ for string
Storage → Storage*     ✅ for array/struct

