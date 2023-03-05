// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Ether {

    function test() public {
        // default equivalente values
        assert(1000000000000000000 wei == 1 ether);
        assert(1 wei == 1);

        assert(1 ether == 1e18);
    }
}