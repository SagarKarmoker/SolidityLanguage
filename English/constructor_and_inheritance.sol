// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract X{

    // this only executed only the smart contract is deployed 
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract Y{
    string public text;

    constructor(string memory _text){
        text = _text;
    }
}

// there are 2 ways to initilize parent contract with parameter
//pass the params here in the inheritance list

contract B is X("input to x"), Y("input to y"){

}

contract C is X, Y{
    constructor (string memory _name, string memory _text) X(_name) Y(_text){

    }
}

// parent contrustors are always called in the order of inheritance 
// regardless of the order of parent contracts listed in the contrusctor of the child contract

// order of constructors called:
// 1. X
// 2. Y
// 3. D

contract D is X, Y {

    constructor() X("input for x") Y("input for y"){
        
    }
}
