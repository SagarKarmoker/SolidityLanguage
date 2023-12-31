// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyCondition {
    // conditions and loops

    uint256[] public nums = [1, 2, 3, 4, 5];

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function isEvenNum(uint256 _num) public pure returns (bool) {
        if (_num % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function countEvenNum() public view returns (uint) {
        uint count = 0;
        for (uint256 i = 1; i < nums.length; i++) {
            if (isEvenNum(nums[i])) {
                count++;
            }
        }

        return count;
    }

    function isOwner() public view returns (bool) {
        return (msg.sender == owner);
    }
}
