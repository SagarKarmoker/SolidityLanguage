// SPDX-License-Identifier: UNLICENSED
// FILEPATH: /W:/U Disk/Conference Paper/SolidityLanguage/Project/HotelRoom.sol
pragma solidity ^0.8.0;

contract HotelRoom{

    // not changable states for enums 
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    // who own the hotel rooms 
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant{
        //check status
        require(currentStatus == Statuses.Vacant, "Hotel room already occupied");
        _;
    }

    modifier costs(uint _amount){
        //check price (1 room == 2 ether)
        require(msg.value >=_amount, "Not enough ether");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
}