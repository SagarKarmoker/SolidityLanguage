// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEth{
    // if msg.value is empty
    receive() external payable{}
    // if msg.value is NOT empty
    fallback() external payable{}

    // return the balance of the contract address
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEth{
    function sendViaEth(address payable _to) public payable{
        // .transfer method is by default by solidity
        // msg.value is the amount you requested
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable{
        bool sent = _to.send(msg.value);
        // condition check 
        require(sent, "Failed to send eth"); 
    }

    // this method is recommed to use by Default 
    function sendViaCall(address payable _to) public payable{
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send eth");
    }
}