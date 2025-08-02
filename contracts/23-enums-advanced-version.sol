// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract EnumDemo {

    enum Status {
        Pending,    // 0
        Shipped,    // 1
        Rejected,   // 2
        Accepted,   // 3
        Cancel      // 4
    }

    Status public status;

    // ✅ Get current status
    function getStatus() public view returns (Status) {
        return status;
    }

    // ✅ Set using input (no manual range check needed)
    function setStatus(Status _status) public {
        status = _status;
    }

    // ✅ Predefined assignments
    function reject() public {
        status = Status.Rejected;
    }

    function cancel() public {
        status = Status.Cancel;
    }

    // ✅ Set by casting (Solidity will revert on out-of-range)
    function setByNumber(uint8 value) public {
        status = Status(value); // Now safe, reverts automatically if invalid
    }

    // ✅ Get numeric value
    function getStatusNumber() public view returns (uint8) {
        return uint8(status);
    }

    // ✅ Get string value
    function getStatusString() public view returns (string memory) {
        if (status == Status.Pending) return "Pending";
        if (status == Status.Shipped) return "Shipped";
        if (status == Status.Rejected) return "Rejected";
        if (status == Status.Accepted) return "Accepted";
        if (status == Status.Cancel) return "Cancel";
        return "Unknown";
    }

    // ✅ Prevent cancellation after shipping
    function safeCancel() public {
        require(status != Status.Shipped, " Cannot cancel after shipping");
        status = Status.Cancel;
    }

    // ✅ Mapping for multiple users
    mapping(address => Status) public orderStatus;

    function setMyStatus(Status _status) public {
        orderStatus[msg.sender] = _status;
    }

    function getMyStatusString() public view returns (string memory) {
        Status my = orderStatus[msg.sender];
        if (my == Status.Pending) return "Pending";
        if (my == Status.Shipped) return "Shipped";
        if (my == Status.Rejected) return "Rejected";
        if (my == Status.Accepted) return "Accepted";
        if (my == Status.Cancel) return "Cancel";
        return "Unknown";
    }

    // 🔴 Weak Point — No longer valid in newer compilers
    // function weakPointOutOfRange() public pure returns (Status) {
    //     return Status(255); // ❌ Now reverts instead of silently compiling
    // }
}
