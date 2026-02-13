const hre = require("hardhat");

async function main() {
  const Registry = await hre.ethers.getContractFactory("ResistanceRegistry");
  const registry = await Registry.deploy();

  await registry.deployed();

  console.log("Contract deployed to:", registry.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});