// gets you your smart contract's bytecode
const FaucetContract = artifacts.require("Faucet");

// deployer is an object that will contain the deploy function
// the deploy function migrates your function to the network
module.exports = function (deployer) {
  deployer.deploy(FaucetContract);
};
