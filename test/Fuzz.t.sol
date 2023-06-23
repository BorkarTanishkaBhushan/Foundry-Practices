// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MSB.sol";
contract MSBFuzzTest is Test {
    MSB public b;

    function setUp() public{
        b = new MSB();
    }

    function testMSBManual() public{
        assertEq(b.mostSignificantBit(0), 0);
        assertEq(b.mostSignificantBit(1), 0);
        assertEq(b.mostSignificantBit(2), 1);
        assertEq(b.mostSignificantBit(4), 2);
        assertEq(b.mostSignificantBit(type(uint256).max), 255);
    }

    function mostSignificantBit(uint256 x) private pure returns(uint256) {
        uint256 i = 0;
        while ((x>>=1) > 0)
        {
            i++;
        }
        return i;
    }

    function testMSBFuzz(uint256 x) public{
        uint256 i = b.mostSignificantBit(x);
        uint256 a = mostSignificantBit(x);
        assertEq(i, a);
    }

}
