// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

/* 
function modifier
notes
--modifier are code that can be run before and after the function call
--generally use for 3 reasion
--restrict access, validate inputs, guard against reentrancy hack
*/

contract Modifier{
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Your are not the owner");
        _; // if condition true then rest of the thing will be executed
    }

    modifier validAddr(address _addr){
        require(_addr != address(0), "Not valid address");
        _;
    }

    //checking with the modifiers if 
    function changeOwner(address _newOwner) public onlyOwner validAddr(_newOwner){
        owner = _newOwner;
    }   


    // most of the smart contract attacked using the Reentrancy 
    modifier noReentrancy(){
        require(!locked, "No Reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy{
        x -= 1;
        if(i > 1){
            decrement(i-1);
        }
    }
}