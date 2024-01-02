// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract WhileLoop{
    uint256[] data;
    uint8 j = 0;

    function loop() public returns(uint256[] memory){
        while(j < 5){
            j++;
            data.push(j);
        }
        return data;
    }
}