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
}
