// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

/* 
    keccak256(bytes memory) returns (bytes32)
    sha256(bytes memory) returns (bytes32)
    ripemd160(bytes memory) returns (bytes32)
*/

contract RandomNumberGenerator {

    Oracle oracle;
    
    constructor(address oracleAddress) {
        oracle = Oracle(oracleAddress);
    }

    function rand(uint range) external view returns(uint) {
        // grap information from blockchain randomly to generate random numbers
        // abi.encodePacked: concatonates arguments nicely.
        // timestamp and prevrandao can be found by miners, hence, it is not secure.
        return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.prevrandao, msg.sender))) % range;
    }
}

// Oracle dynamic feeds
// A database management system is not only used for storing the data but to effectively manage
// it and provides high performance, authorized access and failure recovery features.
contract Oracle {

    address admin;
    uint public rand;

    constructor() {
        admin = msg.sender;
    }

    function set(uint _rand) external {
        require(msg.sender == admin, "Onyl admin can call this function!");
        rand = _rand;
    }
}