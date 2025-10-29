# 🧩 Multi-User To-Do List dApp (v1)

A decentralized **To-Do List smart contract** built with Solidity, allowing multiple users to create, manage, and delete their own personal tasks — each tied to their unique wallet address.

This project demonstrates key **Solidity fundamentals** through a practical mini-application designed for beginners to intermediate developers.

- - -

## 📜 Smart Contract Overview

`// SPDX-License-Identifier: MIT pragma solidity 0.8.30;`

This contract allows each Ethereum wallet to maintain its **own list of tasks** directly on the blockchain.  
Each user can:

*   ➕ Add new tasks
    
*   🧾 Retrieve specific or all tasks
    
*   🗑️ Remove tasks
    
*   ✏️ Update existing tasks
    
*   🔢 Check how many tasks they have
    

Access is strictly limited to the **owner of the wallet address** (via the `onlyOwnerOf` modifier).

- - -

## 🧠 Key Concepts Demonstrated

| Concept | Description |
| --- | --- |
| **Variables** | Store user tasks and internal states |
| **Structs** | Define the structure of each `Task` (ID, description, completed) |
| **Mappings** | Link each user address to their list of tasks |
| **Arrays** | Store and manage multiple `Task` structs per user |
| **Functions** | Implement core CRUD operations (Create, Read, Update, Delete) |
| **Visibility Specifiers** | Use `public`, `view`, and `private` appropriately |
| **Modifiers** | Enforce access control and reuse permission logic (`onlyOwnerOf`) |

- - -

## ⚙️ Contract Structure

### `struct Task`

Represents a single to-do item:

`struct Task { uint id; string description; bool completed; }`

### `mapping(address => Task[]) private userTaks`

Associates each user’s wallet address with an array of their tasks.

- - -

## 🧩 Core Functions

| Function | Description |
| --- | --- |
| `addTask(address _address, string memory _description, bool _completed)` | Adds a new task for the specified user |
| `getTask(address _address, uint _taskId)` | Retrieves a specific task by its ID |
| `getAllTasksByUser(address _address)` | Returns all tasks created by the user |
| `getAmountOfTasksByUser(address _address)` | Returns how many tasks a user has |
| `updateTask(address _address, uint _taskId, string memory _description, bool _completed)` | Updates a task’s text or status |
| `removeTask(address _address, uint _taskId)` | Deletes a task using swap-and-pop (efficient removal) |

- - -

## 🔐 Access Control

### Modifier: `onlyOwnerOf(address _address)`

Ensures that **only the wallet owner** can modify or view their tasks.

`modifier onlyOwnerOf(address _address) { require(msg.sender == _address, "Sender does not own the address!"); _; }`

This prevents unauthorized access and keeps each user’s task list private.

- - -

## 🚀 How to Deploy & Test

1.  **Open Remix IDE**
    
2.  Create a new file named `ToDo.sol`
    
3.  Paste the contract code
    
4.  Compile using Solidity **v0.8.30**
    
5.  Deploy using any environment (Injected Provider, Remix VM, etc.)
    
6.  Interact with the contract functions:
    
    *   `addTask` → Add a new task
        
    *   `getAllTasksByUser` → View your list
        
    *   `updateTask` → Modify any task
        
    *   `removeTask` → Delete a task
        

- - -

## 🧪 Example Workflow

1.  **Add tasks**
    
    `addTask(msg.sender, "Learn Solidity", false); addTask(msg.sender, "Deploy first dApp", false);`
    
2.  **View all**
    
    `getAllTasksByUser(msg.sender);`
    
3.  **Mark one as complete**
    
    `updateTask(msg.sender, 1, "Learn Solidity", true);`
    
4.  **Remove a task**
    
    `removeTask(msg.sender, 2);`
    

- - -

## 💡 Learning Goals

This project helps reinforce:

*   Solidity syntax and contract structure
    
*   Data storage in mappings and arrays
    
*   Access control with modifiers
    
*   Gas-efficient data manipulation (`swap-and-pop`)
    
*   Practical CRUD logic on-chain
    

- - -

## 📄 License

This project is licensed under the **MIT License** — feel free to use, modify, and distribute it.

- - -

**Author:** [Cleyverson Costa](https://github.com/cleyversoncosta)  
**Solidity Version:** 0.8.30  
**License:** MIT