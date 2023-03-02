// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Functions {

    // function function-name(parameter-list) scope returns() { 
    //     statements
    // }

    function remoteControllOpen(bool closedDoor) public returns(bool) {
        if (closedDoor) {
            return true;
        }
        return false;
    }

    function addValues() public view returns(uint) {
        uint a = 5;
        uint b = 10;
        return a + b;
    }

    function multiplyCalculator(uint a, uint b) public view returns(uint) {
        return a * b;
    }

}