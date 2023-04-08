// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "./SafeERC20.sol";
contract TokenTimelock {
    using SafeERC20 for IERC20;
    // ERC20 basic token contract being held
    IERC20 private token;
    // beneficiary of tokens after they are released
    address private beneficiary;
    // timestamp when token release is enabled
    uint256 private releaseTime;
    constructor (IERC20 _token, address _beneficiary, uint256 _releaseTime){
        // solhint-disable-next-line not-rely-on-time
        require(releaseTime > block.timestamp, "TokenTimelock: release time is before current time");
        token = _token;
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }
    function gettoken() public view returns (IERC20) {
        return token;
    }
    function getbeneficiary() public view returns (address) {
        return beneficiary;
    }
    function getreleaseTime() public view returns (uint256) {
        return releaseTime;
    }
    function release() public virtual {
        // solhint-disable-next-line not-rely-on-time
        require(block.timestamp >= releaseTime, "TokenTimelock: current time is before release time");
        uint256 amount = token.balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");
        token.safeTransfer(beneficiary, amount);
    }
}
