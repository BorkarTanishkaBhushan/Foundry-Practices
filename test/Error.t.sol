//SPDX-License-Identifier:MIT
pragma solidity 0.8.13;

import '../src/Error.sol';
import 'forge-std/Test.sol';

contract ErrorTest is Test{
    Error public err;

    function setUp() public{
        err = new Error();
    }

    function testFail() public{
        err.throwError();
    }

    function testRevert() public{
        vm.expectRevert();
        err.throwError();
    }
}