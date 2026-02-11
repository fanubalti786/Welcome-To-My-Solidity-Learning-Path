// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalVars {

    /* ========= MESSAGE INFO ========= */

    // Kisne function call kiya
    function getSender() public view returns (address) {
        return msg.sender;
    }

    // Kitna ETH bheja
    function getMsgValue() public payable returns (uint) {
        return msg.value;
    }

    // Raw calldata
    function getMsgData() public view returns (bytes memory) {
        return msg.data;
    }


    /* ========= BLOCK INFO ========= */

    // Current block time
    function getBlockTime() public view returns (uint) {
        return block.timestamp;
    }

    // Current block number
    function getBlockNumber() public view returns (uint) {
        return block.number;
    }

    // Randomness seed (PoS)
    function getPrevRandao() public view returns (uint) {
        return block.prevrandao;
    }

    // Miner / validator address
    function getBlockMiner() public view returns (address) {
        return block.coinbase;
    }

    // Block gas limit
    function getGasLimit() public view returns (uint) {
        return block.gaslimit;
    }

    // Base fee (EIP-1559)
    function getBaseFee() public view returns (uint) {
        return block.basefee;
    }


    /* ========= TRANSACTION INFO ========= */

    // Gas price
    function getTxGasPrice() public view returns (uint) {
        return tx.gasprice;
    }

    // Transaction origin (⚠️ avoid for auth)
    function getTxOrigin() public view returns (address) {
        return tx.origin;
    }


    /* ========= CONTRACT INFO ========= */

    // Contract ka address
    function getContractAddress() public view returns (address) {
        return address(this);
    }

    // Contract balance
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
