// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//Visibility

contract Parent{

    string private pText = "This is private text";
    string public pubText = "This is public text";
    string internal inText = "This is internal text";

    function privateFunc() private pure returns(string memory){
        return "Private func in Parent";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns(string memory){
        return "Internal func called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
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
    function testInternalFunc() public pure override returns(string memory){
        return internalFunc();
    }
}