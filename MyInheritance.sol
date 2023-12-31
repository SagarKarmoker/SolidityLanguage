// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// inheritance

contract Ownable{
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }


    constructor(){
        owner = msg.sender;
    }
}


contract SecretVault {
    string secret;

    constructor(string memory _secret){
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

// now this smart contract will create another smart contract 
contract MyContract is Ownable{

    address secretVaults;

    constructor(string memory _secret){
        super; //calling the Ownable class constructor from this constructor
        SecretVault _secretVault = new SecretVault(_secret);
        secretVaults = address(_secretVault); // storign the created vault addresses
    }

    //calling one contract from another smart contract
    function getSecret() public view returns(string memory){
        return SecretVault(secretVaults).getSecret();
    }

}