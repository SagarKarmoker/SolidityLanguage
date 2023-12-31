// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// inheritance

contract Ownable{
    
}


contract MyContract {
    address owner;
    string secret;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor(string memory _secret){
        secret = _secret;
        owner = msg.sender;
    }

    function getSecret() public view onlyOwner returns(string memory){
        return secret;
    }
}