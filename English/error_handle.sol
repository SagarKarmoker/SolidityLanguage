// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Require{
    function checkPoint(uint256 _input) public view returns(string memory){
        // condition checking (arg check and message)
        require(_input >= 0, "invalid uint8");
        require(_input <= 255, "invalid uint8");

        return "input is uint8";
    }

    function evenNum(uint256 _num) public view returns(bool){
        require(_num % 2 == 0, "Not an even number");
        return true;
    }
}