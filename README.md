

# DegenToken Contract

DegenToken is an ERC-20 token contract that enables the creation of redeemable tokens and includes standard ERC-20 functionalities. This contract is designed to be deployed on the Ethereum blockchain.

## Overview

The DegenToken contract offers the following features:

1. **Redeemable Tokens**: Users can create redeemable tokens by providing a name and an amount, which can be later redeemed by other users.

2. **Minting**: Only the contract owner can mint new tokens, providing control over the token supply.

3. **Decimals**: The token has 0 decimal places, behaving like a whole number.

4. **Balance Inquiry**: Users can check their Degen token balance.

5. **Token Transfer**: Users can transfer Degen tokens to other addresses.

6. **Token Burning**: Users can burn their own tokens, reducing the total supply.

7. **Token Redemption**: Users can redeem tokens created by others.

## Contract Functions

### `createRedeem(string memory _name, uint256 _amount) external`

Allows users to create redeemable tokens with a specified name and amount.

### `mint(address to, uint amount) public onlyOwner`

Allows the contract owner to mint new tokens and assign them to a specified address.

### `decimals() override public pure returns (uint8)`

Overrides the ERC-20 function to specify the number of decimal places (0 in this case).

### `getBalance() external view returns(uint256)`

Allows users to check their Degen token balance.

### `transferTokens(address _receiver, uint256 _value) external`

Allows users to transfer Degen tokens to another address.

### `burnTokens(uint amount) external`

Allows users to burn a specified amount of their own tokens.

### `redeemToken(uint8 redeemID_) external`

Allows users to redeem tokens by transferring them to their own address.

### `viewRedeemOwner(uint8 redeemID_) public view returns (address)`

Allows users to view the owner of a specific redeemable token.

### `showRedeem(uint id_) public view returns (Redeemer memory)`

Allows users to view the details of a specific redeemable token.

## Modifiers

### `onlyOwner`

Ensures that only the contract owner can execute certain functions.

## Usage

To deploy and interact with the DegenToken contract, follow these steps:

1. Deploy the contract to the Ethereum blockchain.
2. As the owner, mint new tokens using the `mint` function.
3. Users can create redeemable tokens using the `createRedeem` function.
4. Users can transfer, burn, and redeem tokens as needed.

Note: Ensure that you are using a compatible Ethereum wallet or development environment to interact with the contract.


## Deployment

Deployment
**Contract deployed and verified at '0xbE91503551d7b390186A8fec2296Fe8403cd0378'
