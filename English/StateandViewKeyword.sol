// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract View{

    // state variable
    // uint = uint256 are same 

    uint num1 = 1;
    uint num2 = 2;

    // without "view" keyword when a function is called 
    // if a view keyword is used then you can view the result

    function getResult() public view returns (uint, uint){
        return (num1, num2);
    }


    // we can do internal calculation when using view keyword 
    // it does not effect the state variable

    // view keyword is used to view the state variable not to modify the state variable
    function getResults() public view returns (uint product, uint sum){
        product = num1 * num2;
        sum = num1 + num2;

        return (product, sum);
    }


    // this will update the state variable because
    // view keyword is not used
    function updateStateVar() public returns (uint product, uint sum){
        num1 += 5;
        num2 += 10;

        product = num1 * num2;
        sum = num1 + num2;

        return (product, sum);
    }

}