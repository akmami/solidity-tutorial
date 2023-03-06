// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

// Event is an inheritable member of a contract.
// An event is emitted, it stores the arguments passed in transaction logs.
// These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.

contract Events {

    // 1. declare event
    // 2. emit the event

    // only allwed 3 indexed per event since it consumes a lot of gas
    event NewTrade(
        uint indexed data,
        address from,
        address indexed to,
        uint indexed amount
    );

    function trade(address to, uint amount) external {
        // outside consumer can see the event through web3js
        // block.timestamp is a global variable that gives the current timestamp
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}