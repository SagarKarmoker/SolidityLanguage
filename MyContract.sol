// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract MyContract{
    // state Variable
    // state variable stored(saved) in the blockchain
    uint public myUint = 1; // can be accessed from any where in the smart contract 
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1; // and so on ...........

    int256 public myInt = -5; // negative value can be used when it is int 

    string public hello = "Hello, world !!!";
    bytes32 public hello1 = "Hello, world !!!";

    address public myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


    // custom datatype using struct 
    struct MyStruct {
        uint256 myUint;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello world Sagar");

    // Local Variable
    /*
        pure -> used to modify the blockchain 
    */
    function getValue() public pure returns (uint) {
        // local variable which is only using in a function only
        uint value = 1; // unchanged
        return value;
    }
}