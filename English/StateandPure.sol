// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Pure{
    uint num1 = 4;
    uint num2 = 10;

    // function getData() public view returns (uint, uint){
    //     return (num1, num2);
    // }


    // these variable are local variable 
    // function getData() public pure returns (uint, uint){
    //     uint mynum1 = 30;
    //     uint mynum2 = 40;
    //     return (mynum1, mynum2);
    // }


    // pure will be give error {state variable can not be accessed}
    // if want to access to view because access of state variable
    function getData() public view returns (uint, uint){
        uint mynum1 = 30;
        uint mynum2 = 40;

        uint product = mynum1 * num1;
        uint total = mynum2 + num2;

        return (product, total);
    }


}