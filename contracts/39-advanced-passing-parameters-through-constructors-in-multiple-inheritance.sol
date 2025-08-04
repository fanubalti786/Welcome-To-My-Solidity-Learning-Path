// SPDX-License-Identifier: GPL-3.0

// can't resove this error 
pragma solidity ^0.8.0;

// 🔹 Base contract A
contract A {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}

// 🔹 Contract B - Inherits A virtually
contract B is A {
    string public addB;
    uint public salaryB;

    constructor(string memory _name, uint _age, string memory _add, uint _salary)
        A(_name, _age)
    {
        addB = _add;
        salaryB = _salary;
    }
}

// 🔹 Contract C - Inherits A virtually
contract C is A {
    string public addC;
    uint public salaryC;

    constructor(string memory _name, uint _age, string memory _add, uint _salary)
        A(_name, _age)
    {
        addC = _add;
        salaryC = _salary;
    }
}

// 🔹 Contract D inherits B and C and overrides A once
contract D is B, C {
    constructor()        
        B("Irfan", 22, "Karachi", 40000)    // B constructor
        C("Irfan", 22, "Lahore", 50000)     // C constructor
    {}

    
}


