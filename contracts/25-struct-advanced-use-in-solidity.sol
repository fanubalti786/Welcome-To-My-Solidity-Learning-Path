// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Employee Manager Contract
/// @notice Handles employee records using struct array with full CRUD functionality
contract EmployeeManager {
    
    // 🔹 Define the employee structure
    struct Emp {
        string name;
        uint age;
        address acc;
    }

    // 🔹 Dynamic array to store all employee records
    Emp[] public emps;

    // ─────────────────────────────────────────────────────
    // 🔹 ADD EMPLOYEE METHODS
    // ─────────────────────────────────────────────────────

    /// @notice Add employee using inline struct in push
    function addEmpInline(string memory _name, uint _age) public {
        emps.push(Emp(_name, _age, msg.sender));
    }

    /// @notice Add employee using temporary memory struct (more readable, scalable)
    function addEmpStructured(string memory _name, uint _age) public {
        Emp memory temp = Emp({
            name: _name,
            age: _age,
            acc: msg.sender
        });

        emps.push(temp);
    }

    // ─────────────────────────────────────────────────────
    // 🔹 VIEW EMPLOYEE
    // ─────────────────────────────────────────────────────

    /// @notice View full employee data by index
    /// @dev Requires valid index, otherwise reverts
    function getEmp(uint index) public view returns (string memory, uint, address) {
        require(index < emps.length, "Index out of bounds");

        Emp storage e = emps[index];
        return (e.name, e.age, e.acc);
    }

    // ─────────────────────────────────────────────────────
    // 🔸 DELETE EMPLOYEE METHODS
    // ─────────────────────────────────────────────────────

    /// @notice Soft delete: Only resets fields (struct remains with default values)
    /// ⚠️ Keeps array length same — index remains but values become empty
    function resetEmp(uint index) public {
        require(index < emps.length, "Index out of bounds");
        delete emps[index];  // sets to: "", 0, 0x0
    }

    /// @notice Hard delete: Removes struct completely and shifts array left
    /// ⚠️ Can affect original ordering; gas cost for shifting
    function removeEmp(uint index) public {
        require(index < emps.length, "Index out of bounds");

        for (uint i = index; i < emps.length - 1; i++) {
            emps[i] = emps[i + 1];  // shift all left
        }

        emps.pop(); // remove last duplicate
    }

    /// @notice Delete only the last employee (efficient)
    function popLastEmp() public {
        require(emps.length > 0, "No employees to pop");
        emps.pop();
    }

    // ─────────────────────────────────────────────────────
    // 🔹 TOTAL COUNT
    // ─────────────────────────────────────────────────────

    /// @notice Get total number of employees (includes soft-deleted ones)
    function getCount() public view returns (uint) {
        return emps.length;
    }
}
