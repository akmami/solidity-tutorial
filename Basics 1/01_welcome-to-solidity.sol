// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

/**
* @title WelcomeToSolidity
* @dev first contract
* @custom:dev-run-script welcome-to-solidity.sol
*/
contract WelcomeToSolidity {

    constructor() public {}

    function getResult() public view returns(uint) {
        uint a = 10;
        uint b = 5;
        uint result = a + b;
        return result;
    }
}