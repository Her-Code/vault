// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/// @title SafeMath Library
/// @notice Basic math functions with overflow/underflow protection (not needed in ^0.8.0, but shown for learning)
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }

    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "Underflow");
        return a - b;
    }
}