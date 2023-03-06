// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;
import "hardhat/console.sol";

contract Auction {

    address payable public beneficiary;
    address public bidder;
    uint public auction_end;
    uint public highest_bid;

    mapping(address => uint) pendingReturns;

    event HighestChanged (
        address bidder,
        uint highest_bid
    );

    event AuctionEnded (
        address winner,
        uint bid
    );

    modifier continues {
        assert(block.timestamp < auction_end);
        _;
    }

    modifier validBid(uint amount) {
        console.log(msg.value);
        assert(amount >= highest_bid);
        _;
    }

    constructor(address payable _beneficiary, uint _auction_end) {
        beneficiary = _beneficiary;
        auction_end = block.timestamp + _auction_end;
    }

    function bid() public payable continues validBid(msg.value) {
        

        if (highest_bid != 0)
            pendingReturns[msg.sender] += highest_bid;
        
        bidder = msg.sender;
        highest_bid = uint(msg.value);

        emit HighestChanged(msg.sender, msg.value);
    }

    function withdraw() public payable returns(bool) {
        uint amount = pendingReturns[msg.sender];
        
        if (amount > 0) 
            pendingReturns[msg.sender] = 0;
        
        if (!payable(msg.sender).send(amount)) 
            pendingReturns[msg.sender] = amount;
        
        return true;
    }

    function auctionEnd() public payable {
        if (block.timestamp < auction_end)
            revert("Auction still continues");
        
        emit AuctionEnded(bidder, highest_bid);

        beneficiary.transfer(highest_bid);
    }


}