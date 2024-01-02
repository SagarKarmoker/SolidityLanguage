// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Ifelse{
    uint256 public myNum = 5;
    string public myString;

    function get(uint256 _num) public returns(string memory){
        if(_num == 5){
            myString = "this is 5";
        }
        else if(_num == 4){
            myString = "this is 4";
        }
        else{
            myString = "this is not 5";
        }
    }

    function shortHand(uint256 _num) public returns(string memory){
        return _num == 5 ? myString = "this is 5" : myString = "this is not 5";
    }
}