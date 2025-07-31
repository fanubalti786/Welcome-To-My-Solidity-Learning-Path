// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalVars {
    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getBlockTime() public view returns (uint) {
        return block.timestamp;
    }

    function getBlockNumber() public view returns (uint) {
        return block.number;
    }
}
