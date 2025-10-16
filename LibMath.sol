// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibMath {
    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a + b;
        }
    }
    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a - b;
        }
    }
    function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a * b;
        }
    }
    function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            require(b > 0, 'SafeMath: division by zero');
            return a / b;
        }
    }
}
