// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// if the struct definded in another file then import
// import "./StructDecalered.sol"

//Structs
contract TodoContract {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        // way 1
        todos.push(Todo(_text, false));
        // way 2 key value matpping
        // todos.push(Todo({text: _text, completed: false}));
        // // way 3
        // Todo memory todo;
        // todo.text = _text;
        // todo.completed = false;
        // todos.push(todo);
    }

    function get(uint _index) public view returns(string memory text, bool completed){
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateTodo(string calldata _text, uint _index) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function updateCompleted(uint _index) public{
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

    function getAllTodos() public view returns(Todo[] memory){
        return todos;
    }
}