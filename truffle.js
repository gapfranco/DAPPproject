// Allows us to use ES6 in our migrations and tests.
require("babel-register");

// Edit truffle.config file should have settings to deploy the contract to the Rinkeby Public Network.
// Infura should be used in the truffle.config file for deployment to Rinkeby.

const mnemonic = "candy maple cake sugar pudding cream honey rich smooth crumble sweet treat";

const infuraKey = "601a05417e72468398dca54d9a730d76";

const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    ganache: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/" + infuraKey),
      network_id: 4,
      gas: 4000000,
      gasPrice: 1000000000
    }
  }
};
