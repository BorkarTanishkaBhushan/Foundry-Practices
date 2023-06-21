// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error{
    error NotAuthorized();

    function throwError() external{
        require(false, "Not Authorized");
    }

    function throwCustomError() external{
        revert NotAuthorized();
    }
}