// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    function showMessage() public pure returns (string memory) {
        return "Hello world";
    }
}

contract HelloWorldFactory {
    mapping(address => HelloWorld) public contracts;
    string public errorMsg;
    bytes public errorData;

    function createHelloWorld() public {
        try new HelloWorld() returns (HelloWorld newContract) {
            contracts[msg.sender] = newContract;
        } catch Error(string memory reason) {
            errorMsg = reason;
        } catch (bytes memory data) {
            errorData = data;
        }
    }
}
