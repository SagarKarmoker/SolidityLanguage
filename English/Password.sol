// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordVault{
    string username;
    string password;
    string url; 
    address owner;

    constructor() {
        owner = msg.sender;
    }
}

contract PasswordVaultFactory{
    
    // stores all vaults address
    PasswordVault[] vaults;

    function createFactory() public returns(address){
        PasswordVault vault = new PasswordVault();

        return address(vault);
    }

    // modifier onlyOwner() {
    //     require(owner == msg.sender, "You are not the owner of the vault");
    //     _;
    // }

    function getVault(address _vault) public returns(address) {
        // Function implementation
        
    }
}