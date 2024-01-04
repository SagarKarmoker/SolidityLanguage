// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//Visibility

contract Parent{
    function privateFunc() private pure returns(string memory){
        return "Private func in Parent";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns(string memory){
        return "Internal func called";
    }

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc();
    }

    function publicFunc() public pure returns(string memory) {
        return "public func called";
    }

    function externalFunc() external pure returns(string memory){
        return "external func called";
    }
}

contract Child is Parent{
    
}