// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "forge-std/Test.sol";

contract SignTest is Test{

    function testSignature() public{
        uint privatekey = 123;
        address publickey = vm.addr(privatekey);
        //since public and private keys are mathematical pairs 
        //the public key is computed using the privatekey 

        bytes32 messagaHash = keccak256("SecretMessage");

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privatekey, messagaHash);

        address signer = ecrecover(messagaHash, v, r, s);
        assertEq(publickey, signer);

        //the below code fails
        // bytes32 wrongMsg = keccak256("NotTheMessage Which is signed");
        // signer = ecrecover(wrongMsg, v, r, s);
        // assertEq(publickey, signer);



    }
}