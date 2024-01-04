// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Event {

    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter

    // indexing can be based token, address and other things you want 
    event Log(address indexed sender, string message);

    // empty event
    event AnotherLog();

    // events helps to save lots of gas fees instead of using the storage on
    // blockchain or memory 

    function test() public{
        // declcaring the event 
        emit Log(msg.sender, "testing the event");
        emit Log(msg.sender, "Hello world");
        emit AnotherLog();
    }

}