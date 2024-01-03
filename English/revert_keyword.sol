// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// in revert keyword we only pass the error message 
// no condition check

contract RevertHandler{
    
    function checkOverflow(uint256 _num1, uint256 _num2) public view returns(string memory){
        uint256 sum = _num1 + _num2;

        if(sum < 0 || sum > 255){
            revert("sum overflowed");
        }
        else{
            return "No overflow";
        }
    }

}