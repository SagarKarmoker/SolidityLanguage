// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract DoWhile{
    uint256[] data;

    function loop() public returns (uint256[] memory){
        for(uint8 j = 0; j < 5; j++){
            data.push(j);
        }
        return data;
    }
}