// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;


contract Modulo {
    
    function modulo(uint a, uint b) public pure returns (uint) {
        require(b != 0, "modulo cannot be zero.");
        return a % b;
    }
}