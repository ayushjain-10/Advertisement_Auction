const MyContract = artifacts.require("AdAuction");

module.exports = function(deployer) {
  deployer.deploy(MyContract);
};
