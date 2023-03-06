// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

library Search {

    function indexOf(uint[] storage array, uint value) public view returns(uint) {
        for(uint i=0; i<array.length; i++) {
            if (array[i] == value)
                return i;
        }
        return array.length;
    }
}

contract Test {

    // using A (library( for B (another element)
    using Search for uint[];

    uint[] data;
    
    constructor() {
        for(uint i=1; i<6; i++) {
            data.push(i);
        }
    }

    function getIndex(uint value) public view returns(uint) {
        // return Search.indexOf(data, value);
        return data.indexOf(value);
    }
}