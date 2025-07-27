// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./SafeMath.sol";

/// @title VaultBase - Abstract base contract for shared state and logic
abstract contract VaultBase {
    using SafeMath for uint;

    mapping(address => uint) internal balances;

    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);

    /// @notice Get the balance of a user
    /// @param user The address to check
    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }

    /// @notice Internal function to update balances
    function _addBalance(address user, uint amount) internal {
        balances[user] = balances[user].add(amount);
    }

    function _subtractBalance(address user, uint amount) internal {
        balances[user] = balances[user].sub(amount);
    }

    /// @notice Abstract deposit and withdraw function signatures
    function deposit() public payable virtual;
    function withdraw(uint amount) public virtual;
}