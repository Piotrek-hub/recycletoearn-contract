const RecycleToken = artifacts.require("RecycleToken");
const RecycleContract = artifacts.require("Recycle");

module.exports = async (deployer) => {
  deployer.deploy(RecycleToken)
  deployer.deploy(RecycleContract, "0x3e869098696ef15A17764BDc8436E4E7e6b845F9");
};
