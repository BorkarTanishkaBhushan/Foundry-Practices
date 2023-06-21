pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/Wallet.sol";
contract WalletTest is Test {
    Wallet public walletContract;

    function setUp() public{
        walletContract = new Wallet();
    }

    function testSetOwner() public{
        walletContract.setNewOwner(address(1));
        assertEq(walletContract.owner(), address(1));
    }

    function testFailNotOwner() public{
        vm.prank(address(1));
        walletContract.setNewOwner(address(1));
    }
}

