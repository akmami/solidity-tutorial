// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Arrays {

    uint[] public my_array1;
    uint[] public my_array2;
    uint[200] public my_array3; // fixed size

    constructor() {
        for(uint i=0; i<10; i++) {
            my_array1.push(i);
        }
    }

    function push1(uint number) public {
        my_array1.push(number);
    }

    function push3(uint number) public {
        // my_array3.push(number); // not allowed
    }

    function pop1() public {
        my_array1.pop();
    }

    function pop3() public {
        // my_array3.pop(); // not allowed
    }

    function remove1(uint index) public {
        delete my_array1[index]; // length will remain same
    }

    function getLength1() public view returns (uint) {
        return my_array1.length;
    }

    function getLength3() public view returns (uint) {
        return my_array3.length;
    }

    function getArray() public view returns (uint[] memory) {
        return my_array1;
    }
}