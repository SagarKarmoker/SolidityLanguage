// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Callee{
    uint public x;
    uint public value;

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    } 

    function setXandSendEth(uint _x) public payable returns(uint, uint){
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller{

    // we are recevieing the address
    // _callee = address
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXfromAddr(address _addr, uint _x) public{
        Callee _callee = Callee(_addr);
        _callee.setX(_x);
    }

    function setXandSendEth(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEth{value: msg.sender}(_x);
    }
}