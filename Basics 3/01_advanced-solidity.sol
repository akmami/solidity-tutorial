// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

// function modifiers and inheritance - interactions btw contract
contract C {

    uint data;
    uint public info;

    constructor() {
        info = 10;
    }

    function increment(uint a) internal pure returns(uint) {
        return a+1;
    }

    function updateData(uint _data) public {
        data = _data;
    }

    function getData() public view returns(uint) {
        return data;
    }

    function compute(uint a, uint b) internal pure returns(uint) {
        return a+b;
    }
}

contract D {

    C c = new C();

    function readInfo() public view returns(uint) {
        return c.info();
    }
}

contract E is C {

    uint private result;
    C private c;

    constructor() {
        c = new C();
    }

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getInfo() public view returns(uint) {
        return c.info();
    }

}