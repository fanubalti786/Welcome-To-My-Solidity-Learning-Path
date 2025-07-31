// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract typeExamples
{
    // Value Types
    uint public number = 100;
    bool public flag = true;

    // Reference Types 
    string public name = "irfan";
    uint[] public str = [1,2,3,4,5];

    struct Student {
        string name;
        uint age;
    }

    Student public student = Student("Zara",20);
}