// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

//Inheritance
/* 
Function that is going to be overridden by a child contract must be declared as virtual.

Function that is going to override a parent function must use the keyword override.

Order of inheritance is important.
*/
contract A {
    function func() public pure virtual returns(string memory){
        return "a";
    }
}

// B is inherting the A and also overriding the method func()
contract B is A{
    // Override A.func()
    function func() public pure virtual override returns(string memory){
        return "b";
    }
}

// C is inherting the A and also overriding the method func()
contract C is A{
    function func() public pure virtual override returns(string memory){
        return "c";
    }
}

// --> C is the right most of D
contract D is B, C{
    // inherting multiple contract 
    function func() public pure override(B, C) returns(string memory){
        return super.func(); // c will be print because its right most parent
    }
}

// --> B is the right most of D
contract E is C, B{
    function func() public pure override(C, B) returns (string memory){
        return super.func(); // b will be print because its right most parent
    }
}

contract F is A, B{
    function func() public pure override(A, B) returns(string memory){
        return super.func(); // b will be print because its right most parent
    }
}