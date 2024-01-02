// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract AssertKeyword{

    bool result;

    function checkOverFlow(uint256 num1, uint256 num2) public {
        uint256 sum = num1 + num2;
        // another type of condition check
        // if true next line will executed
        assert(sum <= 255);
        result = true;
    }

    function getResult() public view returns(bool){
        return result;
    }

}