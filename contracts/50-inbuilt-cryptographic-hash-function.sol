// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


contract hashFunction {

    function hash1Keccak256(uint _x, string memory _name, address _add) public pure returns(bytes32)
    {
        return keccak256(abi.encodePacked(_x, _name, _add));
    }

    function hash2Keccak256(uint _x, string memory _name, address _add) public pure returns(bytes32)
    {
        // its also gave diff hash according to first same formula but there we have new abi encode
        return keccak256(abi.encode(_x, _name, _add)); 
    }

    function hashSha256(uint _x, string memory _name, address _add) public pure returns(bytes32)
    {
        return sha256(abi.encodePacked(_x, _name, _add));
    }

    function hashRipemd160(uint _x, string memory _name, address _add) public pure returns(bytes32)
    {
        return ripemd160(abi.encodePacked(_x, _name, _add));
    }
    
}
