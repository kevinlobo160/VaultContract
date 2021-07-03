const VaultContract = artifacts.require("VaultContract");

module.exports = function(deployer) {
  deployer.deploy(VaultContract);
};
