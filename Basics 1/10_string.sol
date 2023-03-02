// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Hello {

    string greetings = 'Hello!';

    // memory: much like a RAM, in solidity it is a temporary plca to store data
    // memory is wiped out when the execution is completed.
    function sayHello() public view returns(string memory) {
        return greetings;
    }

    function changeGreeting(string memory _change) public {
        greetings = _change;
    }

    function getLength() public view returns(uint) {
        // returns greetings.length;
        bytes memory stringToBytes = bytes(greetings);
        return stringToBytes.length;
    }
} 