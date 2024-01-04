// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable{
    address payable public owner;

    // constructor(){
    //     owner = payable(msg.sender);
    // }

    // Payable constructor can receive Ether

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable{
        // send eth by calling this function
    }

    function notDeposit() public {
        // but this deposit will not work because 
        // this is not payable function 
    }

    function withdraw() public {
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send eth");
    }

    function transfer(address _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send eth");
    }
}