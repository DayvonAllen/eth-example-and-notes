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
  - The Eth blockchain is decentralized.
  - The blockchain consists of blocks of transactions, these transactions are confirmed by thousands of computers to make sure that every transaction is legitmate and valid.
- `Address` - An Ethereum address is a 42-character hexadecimal address derived from the last 20 bytes of the public key controlling the account with 0x appended in front. e.g. `0x71C7656EC7ab88b098defB751B7401B5f6d8976F`.
- `Block` - is a structure that contains transactions and the previous block's hash. 
- `Wallet` - is an application that serves as a maintainer of your ethereum account. It can help you manage your crypto and connect to the blockchain for you and create and send transactions.
- `keccak256` - is the hashing algorithm that is used on the eth blockchain.
- `Mine` - adding a transaction to the blockchain. 
  - This done through software that is ran on the miner's computer.
  - Mining steps:
    1. Get transactions from the mempool.
    2. Order transactions.
    3. Verify transactions.
    4. Add the transactions to blocks by solving some mathematical problem(They have to find a very specific and huge number), this process takes time and computational resources(AVG time 15 seconds). The number they are looking for is called `nonce`.
    5. After the number has been found the blocks can be added to the blockchain(miners are competing with each other to find the number first).
    6. All full nodes are notified of these changes and their state is updated so they can be accurate.
- `Node` - A computer that is connected to the blockchain, they connect to the blockchain by running client software that was made to help computers connect to the blockchain.
  - Examples of client software:
    - `Geth` - written in the Go Programming language.
    - `Parity` - written in the Rust programming language.
  - `Full Node` - Keep the entire database and mempool of the blockchain and can mine transactions.
- `Miner` - full nodes in the block chain that write transaction to the blockchain, they are paid a gas fee for using their computational resources in order to add transactions to the blockchain.
- `Gas Fee` - a small amount of eth(measured in gwei or wei) paid to miners for using their computional resources to write a transaction to the blockchain.
- There are two types of accounts on the eth blockchain, an Externally Owned Account(EOA) and a smart contract:
  - `Externally Owned Account`(EOA) - An Ethereum Externally Owned Account consists of:
    - `Ethereum State` - Where all of the accounts and the balances of those accounts are stored.
      - The eth state contains your `address`.
      - The eth state links to a structure which keeps the balance.
        - This structure consists of the following:
          - `Balance` - your account's balance in ether.
          - `Nonce` - specifies the number of transactions you made from your account.
  - `Smart Contract` - consists of the following:
     - `Ethereum State` - Where all of the accounts and the balances of those accounts are stored.
      - The eth state contains your `address`.
      - The eth state links to a structure which keeps the balance.
        - This structure consists of the following:
          - `Balance` - your account's balance in ether.
          - `Nonce` - specifies the number of transactions you made from your account.
          - `Storage Hash` - pointer to different structures on the eth blockchain.
            - It points to storage, you can store data in the contract using this hash.
          - `Code Hash` - pointer to different structures on the eth blockchain.
            - It contains bytecode, example of bytecode in a smart contract:
```
0x60806040526103e86000557ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff660015534801561003a57600080fd5b5061010d8061004a6000396000f3fe6080604052348015600f57600080fd5b506004361060325760003560e01c806361bc221a146037578063c89f2ce4146051575b600080fd5b603d606b565b60405160489190608e565b60405180910390f35b60576071565b6040516062919060be565b60405180910390f35b60015481565b60005481565b6000819050919050565b6088816077565b82525050565b600060208201905060a160008301846081565b92915050565b6000819050919050565b60b88160a7565b82525050565b600060208201905060d1600083018460b1565b9291505056fea2646970667358221220e6743e517e6a735f9804e3a59d208fc5297466148927c0a76d4229764ab9a11064736f6c63430008090033
```
---