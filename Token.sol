// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './IERC20.sol';
import './LibMath.sol';

contract Token is IERC20 {
    uint256 public totalSupply;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public {
        totalSupply = 1000000;
        balances[msg.sender] = totalSupply;
    }

    function totalSupply() public view override returns (uint256) {
        return totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount <= balances[msg.sender], 'Insufficient balance');
        balances[msg.sender] = LibMath.safeSub(balances[msg.sender], amount);
        balances[recipient] = LibMath.safeAdd(balances[recipient], amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowance[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(amount <= balances[sender], 'Insufficient balance');
        require(amount <= allowance[sender][msg.sender], 'Insufficient allowance');
        balances[sender] = LibMath.safeSub(balances[sender], amount);
        allowance[sender][msg.sender] = LibMath.safeSub(allowance[sender][msg.sender], amount);
        balances[recipient] = LibMath.safeAdd(balances[recipient], amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }
}
