## Web3.js
- It's a collection of libraries that allow you to interact with a local or remote ethereum node(a computer that's running ethereum client software).
---

## Truffle
- A world class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine(EVM).
  - Helps you in your development of smart contracts.
  - Installation command using node: `npm install truffle -g`
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
---

## Ganache
- Private blockchain that you can download on your computer, it's used for development purposes.
---

## Ethereum Blockchain Terminology
- `Blockchain` - A system or a platform where computers are connected to each other and follow some specific rules.
  - The ethereum blockchain runs based of  `ether` or `eth`, that's the currency of the blockchain. So every transaction that writes to the blockchain requires some amount of ether to do so.
  - The blockchain keeps a singleton state, so all nodes connected to the blockchain have to keep the same state. This is done through a database that all nodes maintain.
  - There is also a `mempool` to help keep track of all transactions so all nodes can remain in sync.
  - The blockchain consists of blocks of transactions.
- `Mine` - adding a transaction to the blockchain. 
  - This done through software that is ran on the miner's computer.
  - Mining steps:
    1. Get transactions from the mempool.
    2. Order transactions.
    3. Verify transactions.
    4. Add the transactions to blocks by solving some mathematical problem(They have to find a very specific and huge number), this process takes time and computational resources(AVG time 15 seconds). The number they are looking for is called `nonce`.
    5. After the number has been found the blocks can be added to the blockchain(miners are competing with each other to find the number first).
- `Node` - A computer that is connected to the blockchain, they connect to the blockchain by running client software that was made to help computers connect to the blockchain.
  - Examples of client software:
    - `Geth` - written in the Go Programming language.
    - `Parity` - written in the Rust programming language.
  - `Full Node` - Keep the entire database and mempool of the blockchain and can mine transactions.
- `Miner` - full nodes in the block chain that write transaction to the blockchain, they are paid a gas fee for using their computational resources in order to add transactions to the blockchain.
- `Gas Fee` - a small amount of eth(measured in gwei or wei) paid to miners for using their computional resources to write a transaction to the blockchain.
- `Address` - is a 20 byte number in hexadecimal format.
- `Block` - is a structure that contains information about a certain transaction and the previous block's hash.
---