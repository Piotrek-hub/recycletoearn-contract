const RecycleToken = artifacts.require("RecycleToken");
const RecycleContract = artifacts.require("Recycle");

module.exports = async (deployer) => {
  // deployer.deploy(RecycleToken)
  deployer.deploy(RecycleContract, "0x61F40abfb7314876dA67dee16727a0F39b7e97b6", "0xf6af0cEa9e6be541C981adB007F0b1695Bc0C5f5");
};
