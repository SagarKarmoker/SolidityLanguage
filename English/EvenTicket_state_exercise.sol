// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//Event Ticket
contract EventTicket{

    uint256 numOfTicket;
    uint256 ticketPrice;
    uint256 totalAmount;
    uint256 startAt;
    uint256 endAt;
    uint256 timeRange;
    string message = "Buy you first Event Ticket";

    constructor(uint256 _ticketPrice){
        ticketPrice = _ticketPrice;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days; // will be end after 7 days 
        timeRange = (endAt - startAt) / 60 / 60 / 24;
    }

    function buyTicket(uint256 _value) public returns (uint256 ticketID) {
        numOfTicket++; 
        totalAmount += _value;
        ticketID = numOfTicket;
    }

    function getAmount() public view returns(uint256) {
        return totalAmount;
    }

}