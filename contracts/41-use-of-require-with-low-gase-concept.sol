// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract useOfRequire
{
    string public name;
    uint public age;

    function chechRequire(uint _age, string memory _name) public 
    {
        age = _age; // this state changing outomatically revert in original state
        require(_age > 18, "you don't have cnic");
        name = _name;

    }


    address public owner = msg.sender;
    string public manager;

    function onlyOwner(string memory _manager) public 
    {
        require(msg.sender == owner, "you are not owner");
        manager = _manager;

    }

}
