// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingAdvanced {

    // 🔹 Struct for user
    struct User {
        string name;
        uint age;
    }

    // 🔹 Mappings
    mapping(address => User) public users;
    mapping(address => mapping(uint => string)) public userNotes;

    // 🔹 To allow looping and deletion
    address[] public userList;
    mapping(address => bool) public exists;

    // ✅ Add user with tracking
    function addUser(string memory _name, uint _age) public {
        if (!exists[msg.sender]) {
            userList.push(msg.sender);
            exists[msg.sender] = true;
        }
        users[msg.sender] = User(_name, _age);
    }

    // ✅ Update user age
    function updateUserAge(uint _newAge) public {
        require(bytes(users[msg.sender].name).length != 0, "User not found!");
        users[msg.sender].age = _newAge;
    }

    // ✅ Delete user
    function deleteUser() public {
        delete users[msg.sender];
        exists[msg.sender] = false;
    }

    // ✅ Add note (nested mapping)
    function addNote(uint _id, string memory _note) public {
        userNotes[msg.sender][_id] = _note;
    }

    // ✅ Delete note
    function deleteNote(uint _id) public {
        delete userNotes[msg.sender][_id];
    }

    // ✅ Manual full purge (mapping doesn't support native deletion)
    function clearAllUsers() public {
        for (uint i = 0; i < userList.length; i++) {
            address user = userList[i];
            delete users[user];
            exists[user] = false;
        }
    }

    // 🔸 Weak Points:
    // - Mapping keys must be tracked externally for full deletion
    // - Mapping cannot be iterated or counted internally
    // - Mapping only supports storage (not memory or arrays)
}
