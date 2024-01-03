// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Array{
    uint[] public arr;
    uint[] public arr2 = [1,2,3];
    uint[10] public fixedArr;
    
    function get(uint i) public view returns(uint){
        return arr[i];
    }

    //solidity can return entier array  
    // But it is recommned to use fixed size array to size the gas fees
    // becasue the undefined array can cost unlimited gas price 

    function push(uint val) public {
        arr.push(val);
    }

    function pop() public {
        arr.pop();
    }

    function getLen() public view returns (uint) {
        return arr.length;
    }

    function removeByIdx(uint index) public{
        delete arr[index];
    }

    function examples() external {
        // create array is memory, only fixed size can be created 
        // defining array into the memory 
        // uint[] memory a = new uint[](5);
    }
}