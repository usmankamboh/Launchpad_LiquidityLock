// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
pragma experimental ABIEncoderV2;
import "./Ownable.sol";
contract InvestmentsInfo is Ownable {
    uint256 private devFeePercentage = 1;
    uint256 private minDevFeeInWei = 1 ether;
    address[] private presaleAddresses;
    function addPresaleAddress(address _presale) external returns (uint256) {
        presaleAddresses.push(_presale);
        return presaleAddresses.length - 1;
    }
    function getPresalesCount() external view returns (uint256) {
        return presaleAddresses.length;
    }
    function getPresaleAddress(uint256 Id) external view returns (address) {
        return presaleAddresses[Id];
    }
    function getDevFeePercentage() external view returns (uint256) {
        return devFeePercentage;
    }
    function setDevFeePercentage(uint256 _devFeePercentage) external onlyOwner {
        devFeePercentage = _devFeePercentage;
    }
    function getMinDevFeeInWei() external view returns (uint256) {
        return minDevFeeInWei;
    }
    function setMinDevFeeInWei(uint256 _minDevFeeInWei) external onlyOwner {
        minDevFeeInWei = _minDevFeeInWei;
    }
}
