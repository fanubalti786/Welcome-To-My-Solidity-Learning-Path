// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract BasicTypes
{
    uint public u = 10;
    int public i = -10;
    address public a = msg.sender;
    bool public b = true;
    string public str = "Hello World";
    bytes public by = "Hello World";
    bytes32 public by32 = "Hello World";
    uint8 public u8 = 10;

}