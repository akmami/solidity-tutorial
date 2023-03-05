// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract WithdrawPattern {

    mapping(address => uint) balance;

    function withdrawFunds(uint amount) public payable returns(bool success) {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        return true;
    }
}