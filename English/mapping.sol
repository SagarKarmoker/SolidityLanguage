// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Mapping{

    // mapping(keyType => valueType)
    mapping(address => uint) public myMap;

    // Mapping always returns a value
    // If the value was never set, it will be return the default value
    function getUser(address _addr) public view returns (uint) {
        return myMap[_addr];
    }   


    // id can be auto generated 
    function setUser(address _addr, uint _id) public {
        myMap[_addr] = _id;
    }


    function removeUser(address _addr) public{
        delete myMap[_addr];
    }

}

contract NestedMapping{

    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nestedMap;
    
    function getUser(address _addr, uint _id) public view returns(bool){
        // you can get values from a nested mapping
        // even when it is not initilized 
        return nestedMap[_addr][_id];
    }

    function setUser(address _addr, uint _id, bool _bool) public {
        nestedMap[_addr][_id] = _bool;
    }

    function removeUser(address _addr, uint _id) public{
        delete nestedMap[_addr][_id];
    }
}