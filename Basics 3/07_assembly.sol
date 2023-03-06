// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Assembly {
    // https://ethereum.org/en/developers/docs/evm/opcodes/

    function addToEVM() external {
        uint x;
        uint y;
        
        assembly {
            // use := to bring opcodes
            let z := add(x, y)

            // if for

            // load data for a specific slot
            let a := mload(0x40)

            // store smt temp to memory
            mstore(a, 4)

            // persistant storage
            sstore(a, 100)
        }
    }

    function addToEVM2() public view returns(bool success) {
        uint size;
        address addr;

        // check whether an address contains any bytes of code or not
        assembly {
            size := extcodesize(addr)
        }

        if (size > 0)
            return true;

        return false;
    }

    function addToEVM3() public view {
        bytes memory data = new bytes(10);
        bytes32 dataB32;

        assembly {
            dataB32 := mload(add(data,32))
        }
    }

}