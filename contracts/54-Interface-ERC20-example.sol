// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ERC-20 interface import
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract TokenBalanceChecker {
    
    // ✅ Function to get token balance
    function getBalance(address tokenAddress, address user) external view returns (uint256) {
        
        // 1️⃣ Variable me store karke (Readable & Reusable)
        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(user);
        return balance;
        
        // 2️⃣ Direct call method (Short syntax)
        // return IERC20(tokenAddress).balanceOf(user);
    }
}
