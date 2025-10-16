// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './IERC20.sol';
import './Token.sol';

contract TestToken is IERC20 {
    Token public token;

    constructor() public {
        token = new Token();
    }

    function testBalanceOf() public view returns (uint256) {
        return token.balanceOf(address(this));
    }
}
