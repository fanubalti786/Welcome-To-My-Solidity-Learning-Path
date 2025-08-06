// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @title Data Location Example: Memory vs Calldata
/// @notice Demonstrates how memory and calldata affect gas usage in function parameters
contract DataLocationExample {

    /// @dev Accepts string and array as memory (copied in memory)
    /// @notice Higher gas cost due to full memory copy
    function useMemory(string memory str, uint[] memory arr) public pure {
        processInMemory(arr);
        // processInCalldata(arr); // ❌ Not allowed: memory to calldata
    }


    /// @dev Accepts string and array as calldata (read-only, non-modifiable)
    /// @notice Lowest gas cost — directly accesses calldata without memory copy
    function useCalldata(string calldata str, uint[] calldata arr) public pure {
        processInMemory(arr);    // ✅ allowed: calldata to memory (costly copy)
        processInCalldata(arr);  // ✅ efficient: no copy
    }


    /// @dev Accepts array in memory (copied version)
    function processInMemory(uint[] memory arr) public pure {
        // Can modify `arr` (in memory only)
    }
    

    /// @dev Accepts array in calldata (read-only, zero-copy)
    function processInCalldata(uint[] calldata arr) public pure {
        // Cannot modify `arr`, but gas efficient
    }
}
