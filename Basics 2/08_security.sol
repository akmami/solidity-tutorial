// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Victim {

    function isContract() public view returns(bool) {

        uint size;
        address a = msg.sender;

        assembly {
            size := extcodesize(a)
        }
        return size > 0;
    }
}

contract Attacker {

    bool public trickedYou;
    Victim victim;

    constructor(address _v) {
        victim = Victim(_v);
        trickedYou = ! victim.isContract();
    }
}

// if you call the address from the constructor there are no byte code
// what to do then?? Withdrawal Pattern!!
// instead of transfer method, use send method which returns true false as a result