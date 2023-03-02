// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Member {
    string name;
    uint age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}

// option to call constructor
contract Teacher is Member('Rachel', 28) {

    function getName() public view returns(string memory) {
        return name;
    }
}

// another option to call constructor
contract Boss is Member {

    constructor (string memory n, uint a) Member(n, a) {}

    function getName() public view returns(string memory) {
        return name;
    }
}