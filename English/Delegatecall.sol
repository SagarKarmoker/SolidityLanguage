// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A{
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _to, uint _num) public payable{
         // A's storage is set, B is not modified.
         // this function can be called using the delegatecall
         // call execution based on the abi.encodeWithSignature
        (bool sent, bytes memory data) = _to.delegatecall(
            // make sure that abi encode is correct
            // example: same as function of contract B
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}