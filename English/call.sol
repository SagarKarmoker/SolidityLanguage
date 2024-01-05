// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Recevier{
    event Received(address caller, uint amount, string message);

    fallback() external payable{
        emit Received(msg.sender, msg.value, "Fallback is called");
    }

    function get(string memory _msg, uint _value) public payable returns(uint) {
        emit Received(msg.sender, msg.value , _msg);
        return _value + 1;
    }
}

contract Caller{
    event Response(bool success, bytes data);

    function testGetFunction(address _to) public payable {
        // send with custom gas fees 
        (bool sent, bytes memory data) = _to.call{value: msg.value, gas: 5000}(
            abi.encodeWithSignature("get(string, uint)", "call get", 123)
        );
        emit Response(sent, data);
    }

    function testNoFallback(address _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist")
        );
        emit Response(sent, data);
    }
}