// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

// no implementation
// only external
// no constructor
// to state variables

contract Counter {

    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {                        // middle man btw Counter and MyContract
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    
    function incrementCounter(address  _counter) external {
        ICounter(_counter).increment();     // call increment function in Counter
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();  // call for count in Counter
    }
}