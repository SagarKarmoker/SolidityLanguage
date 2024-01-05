// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
    Blockchain based password manager V1.0
    by Sagar Karmoker
 */

contract PasswordVault{
    // owner -> who want to create vault
    address owner;
    address public vaultAddr;
    uint256 createdOn;

    // password storing structure
    struct Password{
        string username;
        string email;
        string password;
        string url;
    }

    Password[] passVault;

    // during the factory contract calling the owner will be set
    constructor(){
        owner = msg.sender;
        vaultAddr = address(this);
        createdOn = block.timestamp;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner of this vault");
        _;
    }

    function getOwner() public view onlyOwner returns (address) {
        return owner;
    }

    function addPass(
        string memory _username,
        string memory _email,
        string memory _password,
        string memory _url
    ) public onlyOwner {
        passVault.push(Password(_username, _email, _password, _url));
    }

    function getVault() public view onlyOwner returns(Password[] memory) {
        return passVault;
    }

    function destoryVault() public onlyOwner {
        // destory the vault 
    }

}

contract PasswordVaultFactory{
    // Mapping from user addresses to their vaults
    mapping(address => PasswordVault) private userVaults;

    event CreateVault(address indexed user, address vaultAddr);
    event AddPassword(bool success);

    modifier VaultCheck() {
        require(address(userVaults[msg.sender]) != address(0), "Vault does not exist");
        _;
    }

    function createVault() public {
        require(address(userVaults[msg.sender]) == address(0), "Vault already exists");

        PasswordVault vault = new PasswordVault();
        userVaults[msg.sender] = vault;
        emit CreateVault(msg.sender, address(vault));
    }

    function addPass(
        string memory _username,
        string memory _email,
        string memory _password,
        string memory _url
    ) public VaultCheck {
        PasswordVault userVault = userVaults[msg.sender];
        userVault.addPass(_username, _email, _password, _url);
        emit AddPassword(true);
    }

    function getVaultAddr() public view VaultCheck returns (PasswordVault){
        return userVaults[msg.sender];
    }

    function getVault() public view VaultCheck returns(PasswordVault.Password[] memory) {
        PasswordVault userVault = userVaults[msg.sender];
        return userVault.getVault();
    }
    
}