// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";

contract Faucet is Owned, Logger, IFaucet {
    // storage variables(for state)
    // uint256 public funds = 1000;

    // int256 public counter = -10;

    // public means this will be apart of the interface
    // private variables can only be accessed from within the smart contract
    // internal variables can be accessed from within smart contract and also derived smart contracts
    uint256 public numOfFunders;
    mapping(address => bool) private funders;
    mapping(uint256 => address) private lutFunders;

    // allows for you to reuse code that's in the block
    modifier limitWithdraw(uint256 withdrawAmount) {
        require(
            withdrawAmount <= 1000000000000000000,
            "Cannot withdraw more than 1 ether"
        );
        // required for every modifer block, represents the rest of the code from the function that the modifier is wrapped around.
        _;
    }

    // this is a special function
    // it's called when you make a tx that doesn't specify a function name to call
    // payable allows for you to receive ether to execute the function
    // external function are part of the contract interface
    // which means they can be called via contracts and other txs
    receive() external payable {}

    function emitLog() public pure override returns (bytes32) {
        return "Hello World";
    }

    // must be payable so you can send funds in a transaction
    // Transactions (can generate state changes) and require gas fee
    function addFunds() external payable override {
        // msg is a special object that holds information related to the transaction and sender
        // can get data, gas, sender(address), sig, value
        address funder = msg.sender;
        if (!funders[funder]) {
            uint256 index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutFunders[index];
    }

    function withdraw(uint256 withdrawAmount)
        external
        override
        limitWithdraw(withdrawAmount)
    {
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders()
        external
        view
        onlyOwner
        returns (address[] memory)
    {
        address[] memory _funders = new address[](numOfFunders);

        for (uint256 i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }

        return _funders;
    }

    // [pure and view](read only calls, no gas fee)
    // view - indicates that the function will not alter the storage state in any way.
    // pure - even more strict than view, indicates that the function won't read the storage state.
    function justTesting() external pure returns (uint256) {
        return 2 + 2;
    }
}

// external means you cannot call that resource from within your smart contract, they can only be called from outside of the smart contract(if you use the "this" keyword to call a function within your smart-
// contract there will be higher gas fees)
// public means you can call that resource from within your smart contract, they can also be called from outside of the smart contract.
// Block info
// Nonce - a hash that when combined with the minHash proofs that
// the block has gone through proof of work(POW)
// 8 bytes => 64 bits
// to talk to the node on the network you can make JSON-RPC http calls
// JSON RPC is a stateless, light-weight remote procedure call (RPC) protocol. Primarily this specification defines several data structures and the rules around their processing.
// It is transport agnostic in that the concepts can be used within the same process, over sockets, over HTTP, or in many various message passing environments. It uses JSON (RFC 4627) as data format.

// example JS for smart contract communication:
// const instance = await Faucet.deployed();
// instance.addFunds({from: accounts[0], value: "2"})
