// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryVsStorage {
    string public name = "John";

    function changeMemory() public view returns (string memory)
    {
        string memory temp = name;
        return temp;
    }
    struct Student {
        string name;
        uint age;
    }

    // Student public students = Student("irfan", 24); ✔
    // Student[] public students = Student("mumtaz", 30); ×
    // Student[] public students = Student(["mumtaz", 30], ["Ali", 21]); ✔

    Student[] public students;

    function updateStudent() public {
        students.push(Student("Ali", 21));
        Student storage s = students[0];
        s.name = "Updated";
    }
}
