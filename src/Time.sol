// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract Auction{
    uint public startAt = block.timestamp + 1 days;
    uint public endAt = block.timestamp + 2 days;

    function bid() view external{
        require(block.timestamp >= startAt && block.timestamp <= endAt, "Cannot Bid!");
    }

    function end() view external{
        require(block.timestamp >= endAt, "Cannot Stop!");
    }
}