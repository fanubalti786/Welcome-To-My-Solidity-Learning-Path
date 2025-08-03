
// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;


contract Event 
{
    event balance(address account, string message, uint value);

    function emitBalance(string memory _message, uint _value) public 
    {
        emit balance(msg.sender, _message, _value);
    }


    event chat(address indexed from_, address indexed to_, string message_);

    function emitChat(address _to, string memory _message) public 
    {
        emit chat(msg.sender, _to, _message);
    }
}
