// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;


contract ComparisonOperators {

    uint a = 5;
    uint b = 6;

    function compare() view public {
        require(a > b, "this is false");
    }
}