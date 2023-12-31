// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract SimpleCounter{
    uint public count;

    function increaseCount() public {
        count++;
    }
}