const RecycleToken = artifacts.require("RecycleToken");
const RecycleContract = artifacts.require("Recycle");

module.exports = async (deployer) => {
  deployer.deploy(RecycleToken).then((token) => {
    deployer.deploy(RecycleContract, token.address);
  })
};
