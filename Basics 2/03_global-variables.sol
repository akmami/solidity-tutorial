// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract LedgerBalance {

    // msg.sender is global variable
    // documentation => https://docs.soliditylang.org/en/v0.8.19/cheatsheet.html#global-variables

    mapping(address => uint) balance;

    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }
}

contract Updated {

    function updateBalance() public {
        LedgerBalance ledgerbalance = new LedgerBalance();
        ledgerbalance.updateBalance(30);
    }
}

contract Storage {

    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function setDifficulty() public {
        storedData = block.prevrandao;
    }

    function setTimestamp() public {
        storedData = block.timestamp;
    }

    function setNumber() public {
        storedData = block.number;
    }

    function get() public view returns(uint) {
        return storedData;
    }
}