// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract A{
    string public name = "Contract A";

    function getName() public view returns(string memory){
        return name;
    }
}

contract B is A{
    // overriding the state variable using constractor 
    constructor(){
        name = "Contract B";
    }
    // now the contract B can call the function getName
    // and this will give output "Contract B"
}