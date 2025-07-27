// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./VaultBase.sol";

/// @title VaultManager - Implements deposit and withdraw functionality
contract VaultManager is VaultBase {
    /// @notice Allow users to deposit ETH into the vault
    function deposit() public payable override {
        require(msg.value > 0, "Cannot deposit 0 ETH");

        _addBalance(msg.sender, msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    /// @notice Allow users to withdraw ETH from the vault
    /// @param amount The amount to withdraw in wei
    function withdraw(uint amount) public override {
        require(amount > 0, "Withdraw amount must be > 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        _subtractBalance(msg.sender, amount);
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }
}