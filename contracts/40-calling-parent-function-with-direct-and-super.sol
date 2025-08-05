// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.0;


contract A 
{
    event log(string name, uint age);

    function fun1() public virtual
    {
        emit log("A.fun1", 22);
    }


    function fun2() public virtual
    {
        emit log("A.fun2", 22);
    }
}



contract B is A
{

    function fun1() public virtual override
    {
        emit log("B.fun1", 23);
        A.fun1();
    }


    function fun2() public virtual override
    {
        emit log("B.fun2", 23);
        super.fun2();
    }
}



contract C is A
{

    function fun1() public virtual override
    {
        emit log("C.fun1", 24);
    }


    function fun2() public virtual override
    {
        emit log("C.fun2", 24);
    }
}


contract D is B, C
{
    function fun1() public override(B,C)
    {
        emit log("D.fun1", 25);
        B.fun1();
    }


    function fun2() public override(B,C)
    {
        emit log("D.fun2", 25);
        super.fun2();
    }
}



contract E is C, B
{
    function fun1() public override(B,C)
    {
        emit log("E.fun1", 26);
        B.fun1();
    }


    function fun2() public override(B,C)
    {
        emit log("E.fun2", 26);
        super.fun2();
        // is super ki calling ki samaj nahi ai kuch tu advance hn yaha s
    }
}
