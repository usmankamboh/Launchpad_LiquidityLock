import { isAddress } from "ethers/lib/utils";
import { ethers } from "hardhat";
async function main() {
  
  const InvestmentsInfo = await ethers.getContractFactory("InvestmentsInfo");
  const _InvestmentsInfo= await InvestmentsInfo.deploy();
  await _InvestmentsInfo.deployed();
  console.log("InvestmentsInfo deployed to:", _InvestmentsInfo.address);

  const InvestmentsFactory = await ethers.getContractFactory("InvestmentsFactory");
  const _InvestmentsFactory = await InvestmentsFactory.deploy(_InvestmentsInfo.address);
  await _InvestmentsFactory.deployed();
  console.log("InvestmentsFactory address", _InvestmentsFactory.address);

  const InvestmentsPresale = await ethers.getContractFactory("InvestmentsPresale");
  const _InvestmentsPresale = await InvestmentsPresale.deploy(_InvestmentsFactory.address,"0x41B8FC2B824936Da4Cc334De9762786849fBFAb7");//devaddress
  await _InvestmentsPresale.deployed();
  console.log("InvestmentsPresale address", _InvestmentsPresale.address);


}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
/*InvestmentsInfo deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
InvestmentsFactory address 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
InvestmentsPresale address 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0*/