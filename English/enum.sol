// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Enum{
    // Here Enum representing shipping status
    // Returns uint
    // Pending 0
    // Shipped 1
    // Accepted 2
    // Rejected 3
    // Canceled 4

    // just like array index
    enum Status{
        Pending, 
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element Listed in
    // definition of the type, in this case "Pending"

    Status public status;
    
    function get() public view returns(Status){
        return status;
    }

    function set(Status _status) public{
        status = _status;
    }

    function cancel() public{
        status = Status.Canceled;
    }

    function accept() public{
        status = Status.Accepted;
    }

    // and so on....

    // reset the enum to its default value
    function reset() public{
        delete status;
    }
}