// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
    // storage variables(for state)
    // uint256 public funds = 1000;

    // int256 public counter = -10;

    // this is a special function
    // it's called when you make a tx that doesn't specify a function name to call
    // payable allows for you to receive ether to execute the function
    // external function are part of the contract interface
    // which means they can be called via contracts and other txs
    receive() external payable {}

    // must be payable so you can send funds in a transaction
    // Transactions (can generate state changes) and require gas fee
    function addFunds() external payable {}

    // [pure and view](read only calls, no gas fee)
    // view - indicates that the function will not alter the storage state in any way.
    // pure - even more strict than view, indicates that the function won't read the storage state.
    function justTesting() external pure returns (uint256) {
        return 2 + 2;
    }
}

// Block info
// Nonce - a hash that when combined with the minHash proofs that
// the block has gone through proof of work(POW)
// 8 bytes => 64 bits
// to talk to the node on the network you can make JSON-RPC http calls
// JSON RPC is a stateless, light-weight remote procedure call (RPC) protocol. Primarily this specification defines several data structures and the rules around their processing.
// It is transport agnostic in that the concepts can be used within the same process, over sockets, over HTTP, or in many various message passing environments. It uses JSON (RFC 4627) as data format.
