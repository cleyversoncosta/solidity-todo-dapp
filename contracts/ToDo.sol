// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/**
This is a multi-user TODO List dApp (v1), where each user (identified by their wallet address) 
can create, manage, and remove personal tasks.

The primary goal of this mini-project is to demonstrate and validate proficiency 
in key Solidity concepts, including:

    - Variables – defining and managing state
    - Structs – grouping related data into custom types
    - Mappings – associating user addresses with their data
    - Arrays (including nested arrays) – storing collections of items
    - Functions – implementing logic and data manipulation
    - Visibility specifiers – controlling access to contract elements
    - Modifiers – enforcing reusable access-control rules
**/

contract ToDo {
    
    // Data structure representing a single task in the TODO list
    struct Task {
        uint id;
        string description;
        bool completed;
    }

    // Modifier that ensures only the owner of a given address can perform certain actions
    modifier onlyOwnerOf(address _address) {
        require(msg.sender == _address, "Sender does not own the address!");
        _;
    }

    // Mapping that associates each user address with their list of tasks
    mapping(address => Task[]) private userTaks;

    // Adds a new task for the specified user address
    function addTask(
        address _address,
        string memory _description,
        bool _completed
    ) public onlyOwnerOf(_address) {
        userTaks[_address].push(
            Task(userTaks[_address].length + 1, _description, _completed)
        );
    }

    // Retrieves a specific task by its ID for a given user
    function getTask(
        address _address,
        uint _taskId
    )
        public
        view
        onlyOwnerOf(_address)
        returns (uint id, string memory description, bool completed)
    {
        for (uint x = 0; x < userTaks[_address].length; x++) {
            if (userTaks[_address][x].id == _taskId) {
                return (
                    userTaks[_address][x].id,
                    userTaks[_address][x].description,
                    userTaks[_address][x].completed
                );
            }
        }

        // Revert if the specified task ID doesn’t exist
        revert("task id not found");
    }

    // Removes a task by ID using swap-and-pop (fast deletion, order not preserved)
    function removeTask(
        address _address,
        uint _taskId
    ) public onlyOwnerOf(_address) {
        for (uint x = 0; x < userTaks[_address].length; x++) {
            if (userTaks[_address][x].id == _taskId) {
                userTaks[_address][x] = userTaks[_address][
                    userTaks[_address].length - 1
                ];
                userTaks[_address].pop();
                return;
            }
        }

        // Revert if the specified task ID doesn’t exist
        revert("task id not found");
    }

    // Returns all tasks for a specific user address
    function getAllTasksByUser(
        address _address
    ) public view onlyOwnerOf(_address) returns (Task[] memory) {
        return userTaks[_address];
    }

    // Returns the total number of tasks a user has
    function getAmountOfTasksByUser(
        address _address
    ) public view onlyOwnerOf(_address) returns (uint) {
        return userTaks[_address].length;
    }

    // Updates an existing task’s description and completion status
    function updateTask(
        address _address,
        uint _taskId,
        string memory _description,
        bool _completed
    ) public {
        for (uint x = 0; x < userTaks[_address].length; x++) {
            if (userTaks[_address][x].id == _taskId) {
                userTaks[_address][x].description = _description;
                userTaks[_address][x].completed = _completed;
                return;
            }
        }

        // Revert if the specified task ID doesn’t exist
        revert("task id not found");
    }
}