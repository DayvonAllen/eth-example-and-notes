## Truffle
- A world class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine(EVM).
  - Helps you in your development of smart contracts.
  - Installation command using node: `npm install truffle -g`
- Truffle parts:
  - Has a console
  - Which helps you connects to the Web3 API
  - Web3 API connects to the private blockchain ganache(for development purposes, also can connect to mainnet and testnet of ethereum)
- Truffle Commands:
  - `truffle init` - Initializes a boilerplate smart contract project.
    - The generated files include:
      - `truffle-config.js` - places to configure your smart contract settings for the blockchain.
      - `contracts/Migrations.sol` - Smart contract that helps migrate your other smart contracts to the blockchain. 
      - `migrations/1_initial_migration.js` - A place to specify what we should deploy to the blockchain.
  - `truffle console` - Allows us to interact with our smart contract without using a website or web3.js. 
    -  We can do it through the console on our compute.
   - `truffle migrate` - It migrates your smart contracts that are specified in a file under the `migrations` directory to the blockchain.
     - It compiles the smart contract into bytecode and then deploys them to the blockchain.
     - The bytecode of the smart contract will be under `TX DATA`, in ganache you can find this under the `TRANSACTIONS` tab after clicking on a transction block that has the `CONTRACT CREATION` label.
     - `truffle migrate --reset` - allows you to reset your migration.
---