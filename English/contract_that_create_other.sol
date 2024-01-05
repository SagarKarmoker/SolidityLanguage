// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Car{
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner, string memory _model) payable{
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }
}

contract carFactory{
    Car[] public cars;

    function create(address _owner, string memory model) public{
        Car car = new Car(_owner, model);
        cars.push(car);
    }

    function createAndEth(address _owner, string memory model) public payable{
        Car car = (new Car){value: msg.value}(_owner, model);
        cars.push(car);
    }

    function create2(address _owner, string memory model, bytes32 salt) public {
        Car car = (new Car){salt: salt}(_owner, model);
        cars.push(car);
    }

    function create2AndEth(address _owner, string memory model, bytes32 salt) public payable{
        Car car = (new Car){value: msg.value, salt: salt}(_owner, model);
        cars.push(car);
    }

    function getCar(uint _index) public view returns(address owner, string memory model, address carAddr, uint balance){
        Car car = cars[_index];

        return (car.owner(), car.model(), car.carAddr(), address(car).balance); // this created can hold eth
    }


}