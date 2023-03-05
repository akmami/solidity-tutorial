// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract DestructuringFunctions {
    
    uint public changeValue;
    string public tom = "Hello!";

    function f() public view returns (uint, bool, string memory) {
        return (3, true, tom);
    }

    function g() public {
        (changeValue, , ) = f();
    }
}