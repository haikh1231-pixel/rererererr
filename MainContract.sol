// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './IERC20.sol';
import './Token.sol';

contract MainContract {
    IERC20 public token;

    constructor() public {
        token = new Token();
    }
}
