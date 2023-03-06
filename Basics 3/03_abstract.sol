// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;


/*
abstract contract X {
    function x() public view virtual returns(string memory);
}
*/

// base
contract X {
    function x() public view virtual returns(string memory) {}
}

// derive
contract Y is X {

    function x() public override pure returns(string memory) {
        return "Hello";
    }
}

// base contract 
contract Member {

    string name;
    uint age = 38;

    function setName() public view virtual returns(string memory) {}

    function returnAge() public view returns(uint) {
        return age;
    }
}

// derived contract
contract Teacher is Member {
    function setName() public pure override returns(string memory) {
        return "Gordon";
    }
}