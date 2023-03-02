// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

// public private internal external

contract C {

    uint public data = 10;
    uint internal newData = 20; // can only be accessed by itself or inherited ones

    function test() public pure returns(uint) {
        uint newData = 15;
        return newData;
    }

    function test2() external view returns(uint) { // can be called only from outside of the contract
        return data;
    }
}