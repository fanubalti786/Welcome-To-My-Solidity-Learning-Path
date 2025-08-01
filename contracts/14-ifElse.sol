// SPDX-Licence-Identifier: GPL-3.0;

pragma solidity ^0.8.0;

contract ifElse {
    function ifElseStatement(uint256 _x) public pure returns (string memory) {
        string memory val;
        if (_x > 100) {
            val = "Greater than 100";
        } else if (_x < 100) {
            val = "Less than 100";
        } else {
            val = "Equal to 100";
        }

        return val;
    }
}
