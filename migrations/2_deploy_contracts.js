const RecycleToken = artifacts.require("RecycleToken");
const RecycleContract = artifacts.require("Recycle");

module.exports = async (deployer) => {
  // deployer.deploy(RecycleToken)
  deployer.deploy(RecycleContract, "0x8f0755977D9F2eB959e160a08BE7cE9b33e3dd99", "0xcc18fD47e06734f8B96AaF6Dfe15510fb9EA06e8");
};
