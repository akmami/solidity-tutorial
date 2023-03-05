// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract FallBack {

    event Log(uint gas);

    fallback () external payable { // if sending or recieving ether
        // write less code, function will fail if it consumes too much gas
        // invoke send: we get 2300 gas which is enough to emit a log
        // invoke call: we get all the gas

        //special solidity function gasleft that returns how much gas is left
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract Sender {

    // two different functions with same functionality. Differs in gas emition
    function transferToFallBack(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent,) = _to.call{value:msg.value}('');
        require(sent, "Failed to send!");
    }
}