// // SPDX-Licenece-Identifier: GPL-3.0;

// pragma solidity ^0.8.0;

// contract A 
// {
//     string public name;
//     uint public age;

//     constructor(string memory _name, uint _age)
//     {
//         name = _name;
//         age = _age;
//     }
// }



// contract B
// {
//     string public add;
//     uint public salary;

//     constructor(string memory _add, uint _salary)
//     {
//         add = _add;
//         salary = _salary;
//     }
// }


// // first stage 

// // order of written inheritance according to base like to derived
// // A and B has same base like so we can exchange position no matter

// // second stage
// // constant parameter passing 1 
// // order of execution of contructor is
// // A, B, C


// // third stage
// // order of execution all code of contract according to right to left
// // B, A (b kisi bhi variable ko change kery parent me or A bhi kery tu execute B ka variable hoga) &&
// // (or agr func same hovy tu override dono hongy last parent me jesy C ha yaha last parent 
// contract C is A("Ankit",22),B("Delhi",50000)
// {
    
   
// }

// // constant parameter passing 2
// // order of execution of contructor is
// // B, A, D
// contract D is B,A
// {
//     constructor() A("Ankit",22) B("Delhi",50000)
//     {
       
//     }
   
// }


// // dynamically parameter passing
// // order of execution of contructor is
// // A, B, E
// contract E is A,B
// {
    
//     constructor(string memory _name, uint _age, string memory _add, uint _salary) A(_name,_age+1) B(_add,_salary)
//     {
        
//     }
   
// }



// // dynamically parameter passing and constant also
// // order of execution of contructor is
// // B, A, F
// contract F is B("karachi", 33000),A
// {
    
//     constructor(string memory _name, uint _age, string memory _add, uint _salary) A(_name,_age+1)
//     {
        
//     }
   
// }





// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract A {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}

contract B {
    string public add;
    uint public salary;

    constructor(string memory _add, uint _salary) {
        add = _add;
        salary = _salary;
    }
}


// ==========================================
// ✅ Contract C
// 🔹 Inheritance Written: A, B
// 🔹 Inheritance Depth: 1
// 🔹 Parameters: Constant passed in inheritance line
// 🔹 Constructor Execution Order: A ➡ B ➡ C
// 🔹 Function Override Resolution: C → B → A (Right to Left)
// 🔹 Final Inheritance Chain: A → B → C
// 🔹 Functions copy from parent in multi-inheritance: B → A → C
// ==========================================
contract C is A("Ankit", 22), B("Delhi", 50000) {
    // No additional logic
}


// ==========================================
// ✅ Contract D
// 🔹 Inheritance Written: B, A (Reversed)
// 🔹 Inheritance Depth: 1
// 🔹 Parameters: Constant passed via constructor
// 🔹 Constructor Execution Order: B ➡ A ➡ D
// 🔹 Function Override Resolution: D → A → B (Right to Left)
// 🔹 Final Inheritance Chain: B → A → D
// 🔹 Functions copy from parent in multi-inheritance: A → B → C
// ==========================================
contract D is B, A {
    constructor() A("Ankit", 22) B("Delhi", 50000) {
        // Custom logic (if any)
    }
}


// ==========================================
// ✅ Contract E
// 🔹 Inheritance Written: A, B
// 🔹 Inheritance Depth: 1
// 🔹 Parameters: Dynamic passed from E constructor
// 🔹 Constructor Execution Order: A ➡ B ➡ E
// 🔹 Function Override Resolution: E → B → A (Right to Left)
// 🔹 Final Inheritance Chain: A → B → E
// 🔹 Functions copy from parent in multi-inheritance: B → A → E
// ==========================================
contract E is A, B {
    constructor(
        string memory _name,
        uint _age,
        string memory _add,
        uint _salary
    )
        A(_name, _age + 1)
        B(_add, _salary)
    {
        // Custom logic
    }
}


// ==========================================
// ✅ Contract F
// 🔹 Inheritance Written: B(constant), A(dynamic)
// 🔹 Inheritance Depth: 1
// 🔹 Parameters: B has constant values, A gets dynamic from constructor
// 🔹 Constructor Execution Order: B ➡ A ➡ F
// 🔹 Function Override Resolution: F → A → B (Right to Left)
// 🔹 Final Inheritance Chain: B → A → F
// 🔹 Functions copy from parent in multi-inheritance: A → B → F
// 🔹 
// ==========================================
contract F is B("karachi", 33000), A {
    constructor(
        string memory _name,
        uint _age,
        string memory _add,
        uint _salary
    )
        A(_name, _age + 1)
    {
        // Custom logic
    }
}




