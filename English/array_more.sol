// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract ArrayMore{
    // Array Remove by Shifting 
    // [1,2,3] --- remove(1) --- [1,3,3] ---> [1,3]

    uint[] public arr;
    
    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bound");

        for(uint i = _index; i < arr.length; i++){
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2); // index of the arr
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr.length == 4);
        
        arr = [1];
        remove(0);
        assert(arr[0] == 0);

    }
}