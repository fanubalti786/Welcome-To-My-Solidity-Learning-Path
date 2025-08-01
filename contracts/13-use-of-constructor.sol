// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract _constructor
{
    uint public age;
    address public owner;
    string public name;

    constructor(uint _age, string memory _name, address _owner)
    {
        age = _age;
        name = _name;
        owner = _owner;
    }
     
}
