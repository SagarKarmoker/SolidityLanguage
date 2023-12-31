// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Counter{

    uint count;

    /* solidity is a OOP based language
    constructor is only runnable when the contract is deployed
    and initilized the smart contract 
     */

    constructor(){
        count = 0;
    }


    /* 
        public is a keyword used to visible the function
        internal -> when used it can be called inside the particular smart contract
        view -> is a keyword 
     */

    function getCount() public view returns(uint){
        return count;
    }

    function increaseCount() public {
        count = count + 1;
    }

    function decreaseCount() public {
        count = count - 1;
    }

}