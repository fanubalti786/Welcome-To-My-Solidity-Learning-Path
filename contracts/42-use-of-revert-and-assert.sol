// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract useOfRequire
{
    string public name;
    uint public age;


    error throwError(string, address);

    function chechRequire(uint _age, string memory _name) public 
    {
        age = _age; // this state changing outomatically revert in original state
        if(_age <= 18)
        {
            revert throwError("you don't have cnic", msg.sender);
        }
        name = _name;

    }


    address public owner = msg.sender;
    string public manager;

    function onlyOwner(string memory _manager) public 
    {
        if(msg.sender != owner)
        {
            revert throwError("you are not owner", msg.sender);
        }
        manager = _manager;

    }

    function chechOwner() public view
    {
        assert(owner == 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        // assert(owner != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    }

    

}
