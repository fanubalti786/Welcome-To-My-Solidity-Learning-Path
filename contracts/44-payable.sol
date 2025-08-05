// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Payable Contract
 * @author [Your Name]
 * @notice A simple contract to accept and check ETH deposits using payable functions.
 * @dev Demonstrates basic use of `payable` constructor, deposit function, and balance checking.
 */
contract Payable {
    
    // 🔹 Payable constructor to allow ETH to be sent during deployment
    constructor() payable {}

    // 🔹 Owner is the address that deploys the contract; declared as payable in case needed for transfers
    address payable public owner = payable(msg.sender);

    /**
     * @notice Accept ETH deposits to this contract
     * @dev Requires non-zero amount; cannot be view/pure since it modifies state via receiving ETH
     */
    function deposit() public payable {
        require(msg.value > 0, "You need to send some funds!");
        // Funds are automatically added to contract balance when function is payable
    }

    /**
     * @notice Check the current ETH balance of this contract
     * @return balance The balance of the contract in wei
     */
    function checkBalance() public view returns (uint) {
        return address(this).balance; // Returns contract's balance
    }
}
