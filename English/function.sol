// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Function{
    // return many
    function returnMany() public pure returns(uint, bool, uint){
        //returning local variable so use the pure keyword
        return (1, true, 5);
    }

    // return can be named
    function named() public pure returns(uint a, bool b, uint c){
        return (1, true, 19);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.

    function assigned() public pure returns(uint a, bool b, uint c){
        a = 1;
        b = true;
        c = 3;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values..

    function destructingAssignement() public pure returns(uint, bool, uint, uint, uint){
        // getting value from calling another function
        (uint a, bool b, uint c) = returnMany();

        // setting local variable value
        (uint x, uint y) = (4, 5);

        // returning all the values
        return (a, b, c, x, y);
    }

    // Cannot use map for either input or output
    // Can use array for input

    // memory keyword used because it memory used during the function call
    function arrayAsInput(uint[] memory _arr) public{    
        // for(uint8 i = 0; i < _arr.length; i++){
        //     // do something
        // }
    }

    // array as output
    uint[] public arr;
    
    function arrayOutput() public returns(uint[] memory){
        return arr;
    }
}


// Call function with key-value inputs
contract XYZ {
    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {}

    function callFun() external pure returns(uint){
        return someFuncWithManyInputs(1,3,5,address(0),true,"message");
    }

    function callFuncWithValue() external pure returns(uint){
        return someFuncWithManyInputs({x: 1, y: 2, z:3, a: address(0), b: true, c:"message"});
    }

}