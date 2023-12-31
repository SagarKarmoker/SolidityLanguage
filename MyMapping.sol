// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyMapping {
    // mapping works (key, value) pair
    // that works like a database

    // mapping (key => value) myMapping;
    mapping(uint => string) names;
    mapping(uint => Book) public books; //single book 1->book and so on

    //nested mapping
    //address who are holding the books like libery
    mapping(address => mapping(uint => Book)) public myBooks;

    // it can works like dataset, title and author like column
    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Alice";
        names[2] = "Bob";
        names[3] = "Charlie";
    }

    function addBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        // msg.sender -> the person (address) who calling the smart contract
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}
