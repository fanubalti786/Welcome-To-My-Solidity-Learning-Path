// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract Loops {
    function forLoop() public pure returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < 10; i += 2) {
            // Skip the current iteration and continue to the next loop cycle

            if (i == 8) {
                continue;
            }
            count += 5;
        }

        return count;
    }

    function whileLoop() public pure returns (uint256) {
        uint256 count = 0;

        uint256 j = 0;

        while (j < 10) {
            if (j == 6) {
                // Exit the loop immediately
                break;
            }
            count += 5;
            j += 2;
        }

        return count;
    }

    function dowhileLoop() public pure returns (uint256) {
        uint256 count = 0;
        uint256 k = 0;

        do {
            count += 5;
            k += 2;
            // Exit the loop immediately

            break;
        } while (k < 10);

        return count;
    }
}
