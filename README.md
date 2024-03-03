# MyToken

MyToken is an ERC20 token smart contract written in Solidity. It is compatible with OpenZeppelin Contracts version ^5.0.0.

## Overview

This contract provides a basic implementation of an ERC20 token with additional functionalities such as transfer and burn. It inherits from `ERC20` and `Ownable` contracts from OpenZeppelin, allowing for easy customization and ownership management.

## Features

- ERC20 compliant: Implements standard ERC20 interface functions.
- Minting: Only the owner can mint new tokens using the `mint` function.
- Transfer: Users can transfer tokens to other addresses using the `transfer` function.
- Burning: Tokens can be burned by the owner using the `burn` function.

## Installation

To use this contract in your project, you need to import it along with the required OpenZeppelin Contracts.

```solidity
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("MyToken", "MTK")
        Ownable(initialOwner)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }
}
```

## Usage

1. Deploy the `MyToken` contract to the Ethereum network, passing the initial owner's address to the constructor.
2. The owner can then mint new tokens by calling the `mint` function, specifying the recipient's address and the amount of tokens to mint.
3. Users can transfer tokens to other addresses using the `transfer` function.
4. The owner can burn tokens from their own balance using the `burn` function.

## License

This project is licensed under the terms of the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
