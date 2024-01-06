// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
    Blockchain based password manager v1.1.0
    by Sagar Karmoker
    https://github.com/SagarKarmoker
 */

contract PasswordVault {
    // owner -> who want to create vault
    address owner;
    address public vaultAddr;
    uint256 createdOn;

    // password storing structure
    struct Password {
        string username;
        string email;
        string password;
        string url;
    }

    Password[] passVault;

    // during the factory contract calling the owner will be set
    constructor() {
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

    function getVault() public view onlyOwner returns (Password[] memory) {
        return passVault;
    }

    function updatePass(
        uint _index,
        string memory _newusername,
        string memory _newemail,
        string memory _newpass,
        string memory _newurl
    ) public onlyOwner {
        require(_index <= passVault.length, "Index out of bound");
        passVault[_index].username = _newusername;
        passVault[_index].email = _newemail;
        passVault[_index].password = _newpass;
        passVault[_index].url = _newurl;
    }

    function deletePass(uint _index) public onlyOwner returns (bool) {
        if (_index < passVault.length) {
            delete passVault[_index];
            return true;
        }
        return false;
    }

    function destroyVault() public onlyOwner {
        selfdestruct(payable(owner));
    }
}

contract PasswordVaultFactory {
    // Mapping from user addresses to their vaults
    mapping(address => PasswordVault) private userVaults;

    event CreateVault(address indexed user, address vaultAddr);
    event AddPassword(bool success);

    modifier VaultCheck() {
        require(
            address(userVaults[msg.sender]) != address(0),
            "Vault does not exist"
        );
        _;
    }

    function createVault() public {
        require(
            address(userVaults[msg.sender]) == address(0),
            "Vault already exists"
        );

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

    function getVaultAddr() public view VaultCheck returns (PasswordVault) {
        return userVaults[msg.sender];
    }

    function getVault()
        public
        view
        VaultCheck
        returns (PasswordVault.Password[] memory)
    {
        PasswordVault userVault = userVaults[msg.sender];
        return userVault.getVault();
    }

    function updatePass(
        uint _index,
        string memory _newusername,
        string memory _newemail,
        string memory _newpass,
        string memory _newurl
    ) public VaultCheck {
        PasswordVault userVault = userVaults[msg.sender];
        userVault.updatePass(
            _index,
            _newusername,
            _newemail,
            _newpass,
            _newurl
        );
    }

    // Inside PasswordVaultFactory contract
    function deletePass(uint _index) public VaultCheck returns (bool) {
        PasswordVault userVault = userVaults[msg.sender];
        return userVault.deletePass(_index);
    }

    function destoryVault() public VaultCheck {
        PasswordVault userVault = userVaults[msg.sender];
        delete userVaults[msg.sender];
        userVault.destroyVault();
    }
}
