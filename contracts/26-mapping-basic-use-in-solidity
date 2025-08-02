// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingBasics {

    // 🔹 Basic mapping: Address to uint balance
    mapping(address => uint) public balances;

    // ✅ Add value to mapping
    function addBalance(uint _amount) public {
        balances[msg.sender] = _amount;
    }

    // ✅ Update value in mapping
    function updateBalance(uint _newAmount) public {
        require(balances[msg.sender] != 0, "Balance not found!");
        balances[msg.sender] = _newAmount;
    }

    // ✅ Read value
    function getBalance(address _user) public view returns (uint) {
        return balances[_user]; // If not set, returns 0
    }

    // ✅ Delete value (resets to 0)
    function deleteBalance() public {
        delete balances[msg.sender];
    }

    // 🔸 Weakness:
    // - Can't check if key truly exists (0 might be valid value)
    // - No way to loop over mapping
} 
