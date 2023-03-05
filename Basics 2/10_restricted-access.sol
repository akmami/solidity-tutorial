// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;
import "hardhat/console.sol";

contract RestrictedAccess {

    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender is not authorized!");
        _;
    }

    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time, "Function called too early!");
        _;
    }

    modifier costs(uint _amount) {
        console.log(msg.sender.balance);
        console.log(_amount);
        require(msg.sender.balance >= _amount, "Not enough ether is provided!");
        _;
    }

    function changeOwner(address _owner) public onlyBy(owner) {
        owner = _owner;
    }

    function forceOwnerChange(address _newOwner) public payable costs(10 ether) {
        msg.sender.transfer(10);
        owner = _newOwner;
    }

    function disown() public onlyBy(owner) onlyAfter(creationTime + 1814400) {
        delete owner;
    }
}