// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

//constants
// constants used to save gas fees
contract Constants{
    // this is constant (unchangeable)
    // address public constant MY_ADDR = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // function getConstant() public view returns(address){
    //     return MY_ADDR;
    // }

    address public MY_ADDR = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function getConstant() public view returns(address){
        return MY_ADDR;
    }
}