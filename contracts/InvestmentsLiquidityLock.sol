// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "./TokenTimelock.sol";
contract InvestmentsLiquidityLock is TokenTimelock {
    constructor(
        IERC20 _token,
        address presaleCreator,
        uint256 _releaseTime
    ) public TokenTimelock(_token, presaleCreator, _releaseTime) {}
}
