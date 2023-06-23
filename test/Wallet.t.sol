// SPDX-License-Identifier: UNLICENSED 
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/Wallet.sol";
import "forge-std/console.sol";

contract WalletTest is Test {
    Wallet public walletContract;

    function setUp() public{
        walletContract = new Wallet{value: 1e18}();
    }

    function testSetOwner() public{
        walletContract.setNewOwner(address(1));
        assertEq(walletContract.owner(), address(1));
    }

    function testFailNotOwner() public{
        vm.prank(address(1));
        walletContract.setNewOwner(address(1));
    }

    //helperfunction
    function _send(uint amt) private{
        (bool ok,) = address(walletContract).call{value: amt}("");
        require(ok, "Eth Transfer failed");
    }

    function testEthBalance() view public{
        console.log(address(this).balance / 1e18);
    }

    function testSendEth() public{
        //deal(address, uint)
        //used to set the balance of an account
        deal(address(1), 100);
        assertEq(address(1).balance, 100);

        deal(address(1), 10); //this will set the address to 10 and not 100 + 10
        assertEq(address(1).balance, 10);
    
        //hoax(address, uint)
        //deal + prank
        deal(address(1), 140);
        vm.prank(address(1));
        _send(140); //if vm.prank was not set then the msg.sender would be address(this)

        hoax(address(1), 180);
        _send(180);
    
    }


}

