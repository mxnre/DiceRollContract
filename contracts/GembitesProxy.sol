// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title GembitesProxy Contract
 */
contract GembitesProxy is Ownable {
    uint256 public minBetAmount;
    uint256 private lastChangedTime;

    /// @notice Event emitted when GembitesProxy Contract deployed.
    event GembitesProxyDeployed();

    /// @notice Event emitted when min bet amount set.
    event MinBetAmountSet(uint256 newMinBetAmount);

    modifier canSetMinBetAmount() {
        require(block.timestamp >= lastChangedTime + 1 hours, "GembitesProxy: Not time to change");
        _;
    }

    /**
     * @dev Constructor function
     */
    constructor() {
        minBetAmount = 25 * 10**18;

        emit GembitesProxyDeployed();
    }

    /**
     * @dev External function to return min bet amount.
     */
    function getMinBetAmount() external view returns (uint256) {
        return minBetAmount;
    }

    /**
     * @dev External function to set min bet amount. This function can be called by only owner.
     * @param _newMinBetAmount New min bet amount
     */
    function setMinBetAmount(uint256 _newMinBetAmount) external canSetMinBetAmount onlyOwner {
        minBetAmount = _newMinBetAmount;
        lastChangedTime = block.timestamp;

        emit MinBetAmountSet(_newMinBetAmount);
    }
}
