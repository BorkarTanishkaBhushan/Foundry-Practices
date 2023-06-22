//SPDX-License-Identifier:MIT
pragma solidity 0.8.13;

import '../src/Time.sol';
import 'forge-std/Test.sol';

contract TimeTest is Test{
    Auction public auction ;
    uint public startAt;

    function setUp() public{
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testFailBidBeforeStartTime() view public{
        auction.bid();
    }

    function testBid() public{
        vm.warp(startAt + 1 days); //sets block.timestamp to future timestamp
        auction.bid();
    }

    function testFailBidAfterEndTime() public{
        vm.warp(startAt + 3 days);
        auction.bid();
    }
}