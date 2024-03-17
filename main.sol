// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract MetaToken {

    // Declare public variables
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    address public owner;

    // Create a mapping of addresses to balances
    mapping(address => uint256) public balance;

    // Constructor function that sets the token name, symbol, and owner
    constructor() {
        tokenName = "Metacrafters token";
        tokenSymbol = "META";
        owner = msg.sender;
    }

    // Modifier that only allows the owner to execute a function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }


    function mint(address _recipient, uint256 _amount) public onlyOwner {
        totalSupply += _amount;
        balance[_recipient] += _amount;
    }


    function burn(uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient balance");
        totalSupply -= _amount;
        balance[msg.sender] -= _amount;
    }


    function transfer(address _recipient, uint256 _amount) public {
        require(msg.sender != _recipient,"You can not transfer token(s) to yourself!");
        require(balance[msg.sender] >= _amount, "Transfer amount exceeds balance");
        balance[msg.sender] -= _amount;
        balance[_recipient] += _amount;
    }
}
