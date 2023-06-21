// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Hello.sol";

contract HelloTest is Test {
    HelloWorld public hellocontract;

    function setUp() public {
        hellocontract = new HelloWorld();
    }

    function testGreet() public {
        assertEq(hellocontract.greet(), "Hello World!");
    }
}
