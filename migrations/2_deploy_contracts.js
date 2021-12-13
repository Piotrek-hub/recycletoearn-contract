const RecycleToken = artifacts.require("RecycleToken");
const RecycleContract = artifacts.require("Recycle");

module.exports = async (deployer) => {
  // deployer.deploy(RecycleToken)
  deployer.deploy(RecycleContract, "0x900742a35B19FF4E262d644D4419a220c22d08F8", "0xcc18fD47e06734f8B96AaF6Dfe15510fb9EA06e8");
};
