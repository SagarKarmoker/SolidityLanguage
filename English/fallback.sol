// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback{

    // which function and how much gas is left
    event Log(string func, uint gas);

    // fallback is default function just declare it
    fallback() external payable{
        emit Log("Fallback", gasleft());
    }
 
    receive() external payable{
        emit Log("Receive", gasleft());
    }


    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract SendToFallback{
    function transferToFallback(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable{
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to call fallback");
    }
}