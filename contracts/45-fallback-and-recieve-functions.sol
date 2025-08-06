// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract fallBackAndRecive 
{
    event Log(string _func, address _add, uint _value, bytes _data);
    fallback() external payable
    {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable
    {
        emit Log("receive", msg.sender, msg.value, "");
    }

    function checkBalance() public view returns(uint)
    {
        return address(this).balance;
    }
}
    
    
