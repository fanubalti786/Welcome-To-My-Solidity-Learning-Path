// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// 3. Custom Errors
error NotOwner();

// 4. Interfaces / Libraries
// import ...

contract OptimizedContract {
    // 5. State Variables
    address public immutable owner;
    uint256 private count;          // packed together if possible
    uint128 private smallNumber;    // packed in same slot with others if any

    // 6. Structs
    struct Data {
        uint128 a;
        uint128 b;
        uint256 c;
    }

    // 7. Events
    event DataUpdated(uint256 indexed id, uint128 a, uint128 b);

    // 8. Modifiers
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // 9. Constructor
    constructor() {
        owner = msg.sender;
    }

    // 10. External Functions
    function updateData(uint256 id, Data calldata newData) external onlyOwner {
        // logic here
        emit DataUpdated(id, newData.a, newData.b);
    }

    // 11. Internal Functions
    function _helper() private pure {
        // helper logic
    }
}
