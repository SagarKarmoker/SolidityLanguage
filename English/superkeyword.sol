// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//UseOfSuperKeyword

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/


contract A {
    event Log(string message);

    function func1() public virtual{
        emit Log("From contract A func_1 called");
    }

    function func2() public virtual{
        emit Log("From contract A func_2 called");
    }
}

contract B is A{
    function func1() public virtual override{
        emit Log("From contract B func_1 called");
        A.func1();
    }

    function func2() public virtual override{ 
        emit Log("From contract B func_2 called");
        super.func2();
    }
}

contract C is A{
    function func1() public virtual override{
        emit Log("From contract C func_1 called");
        A.func1();
    }

    function func2() public virtual override{ 
        emit Log("From contract C func_2 called");
        super.func2();
    }
}

contract D is C, B{
    function func1() public virtual override(C, B){
        super.func1();
    }

    function func2() public virtual override(C, B){ 
        super.func2();
    }
}