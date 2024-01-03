// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//importing the file
import "./enum.sol";

contract NewEnum{
    enum Status{
        Pending, 
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
}