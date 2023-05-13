const simplewallet = artifacts.require("./SimpleWallet.sol");

module.exports = function (deployer) {
    deployer.deploy(simplewallet);
}