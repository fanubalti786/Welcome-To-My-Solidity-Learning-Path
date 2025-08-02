// SPCX-Licence-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract Struct 
{
    struct Emp{
        string name;
        uint age;
        address acc;
        
    }

    // first initialization
    Emp public emp1 = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    
    // second initialization
    Emp public emp2 = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});


    // third one is not valid on contract level
    // Emp public emp3;
    // emp3.name = "irfan";
    // emp3.age = "24";
    // emp3.acc = msg.sender";




    // we can't initialize struct array in contract level both fixed and dynamic sized 

    // fixed size array with struct
    Emp[3] public emps1;
    // emps1 = Emp(["mumtaz", 30, msg.sender], ["Ali", 21, msg.sender]); 
    // emps1 = Emp([{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}], [{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}]); 
    // emps1[0] = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    // emps1[1] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});



    // dynamic size array with struct 
    Emp[] public emps2;
    // emps2 = Emp(["mumtaz", 30, msg.sender], ["Ali", 21, msg.sender]); 
    // emps2 = Emp([{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}], [{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}]); 
    // emps2[0] = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    // emps2[1] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});






    function setValues() public 
    {

    // first initialization in funciton 
    Emp memory emp4 = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);


    // second initialization in funciton 
    Emp memory emp5 = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});



    //  third initiliazation in funciton
    Emp memory emp6;
    emp6.name = "irfan";
    emp6.age = 24;
    emp6.acc = msg.sender;


    // assigning in state variable of struct
    emp1 = emp4;



    // fixed size array in function 
    // emps1 = Emp(["mumtaz", 30, msg.sender], ["Ali", 21, msg.sender]); 
    // emps1 = Emp([{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}], [{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}]); 
    emps1[0] = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    emps1[1] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});
    emps1[2] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});



    // dynamic size array in function 
    // emps2 = Emp(["mumtaz", 30, msg.sender], ["Ali", 21, msg.sender]); 
    // emps2 = Emp([{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}], [{acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"}]); 
    emps1[0] = Emp("Raj",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    emps1[1] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});
    emps1[2] = Emp({acc: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, age: 21, name:"Raj"});



    }



    // 👇 Function to take input from user for dynamic struct array
    function addEmp(string memory _name, uint _age) public {
        emps2.push(Emp({
            name: _name,
            age: _age,
            acc: msg.sender
        }));
    }


    






    
}
