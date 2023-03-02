// SPDX-License-Identifier: GPL-3.0

// Pure function declares that no state variable will be changed or read. 
// View tells us that by running the function, no data will be saved/changed. 

pragma solidity >= 0.8.2 < 0.9.0;

contract Enums {

    enum frenchFriesSize {LARGE, MEDIUM, SMALL}

    frenchFriesSize choice;
    frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    constructor() {
        choice = frenchFriesSize.LARGE;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }
}