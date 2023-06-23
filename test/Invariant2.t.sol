// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {WETH} from "../src/WETH.sol";


contract WETH_Open_Invariant_Tests is Test {
    WETH public weth;

    function setUp() public {
        weth = new WETH();
    }

    receive() external payable {}

    // NOTE: - calls = runs x depth, (runs, calls, reverts)
    function invariant_totalSupply_is_always_zero() public {
        assertEq(0, weth.totalSupply());
    }
}