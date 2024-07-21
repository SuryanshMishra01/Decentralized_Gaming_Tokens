# Decentralized_Gaming_Tokens
![Avalanche](https://img.shields.io/badge/Avalanche-Fuji_Network-red.svg)

This solidity smart contract 'DegenGamingERC20_Token' is created for a (hypothetical) gaming studio - Degen Gaming where this program will create 'DGN' tokens which can be earned by players in their game and then redeemed for rewards in their in-game stores.
Note: The contract 'myGameAssets' is used here to create in game NFTS which can be exchanged for DGN tokens, no need to deploy it. This contract is already imported in the 'DegenGamingERC20_Token' contract, so deploy that contract only.

# Description
There are two tokens:
### 1) DegenGamingERC20_Token
It is based on standard ERC20 token. So, I have imported the interface from this link: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol to use its functions in my contract.
This contract focuses on 5 functions:
1) mint_Tokens: It can be used by owner (only) to mint 'DGN' tokens as an earned reward to any gamer's address.
2) checkBalance(): To check the token balance of the caller's address.
3) transferTokens(): Any player can transfer their tokens to their friends using this function.
4) redeem_Tokens(): This function is used by the player to exchange (redeem) their token for in-game items (NFTs). In this smart contract, players can enter the indices of whichever item they want and the function will check that if the player has sufficient 'DGN' tokens then transfer it to the contract and mint the NFT and their address.
5) burnTokens(): This function will burn the tokens of the caller and also remove them from the network.

### 2) 'myGameAssets'
It is based on ERC721 token that is used to create NFTs. This contract is used to create in-game assets which can be minted at player's address in exchange for their DGN tokens. This contract is using the given interface: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol
Here, we have 2 main functions:
1) mint_Assets(): It will mint the NFT at the provided address. The meta-data (name & image url) of NFT will also be passed in arguments.
2) show_Assets(): It will show the meta-data of all the NFTs at the caller's address.

# Getting Started

## Executing Program
To run and deploy this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the "DegenGamingERC20_Token.sol" & "myGameAssets.sol" both files from my repo and compile it. To deploy the contract we are using 'Avalanche Fuji C-Chain' testnet connected with Metamask wallet.

## Interacting with program
After deployment, we can interact with program by calling the functions that will appear on the left as shown in the screen shot.

![image](https://github.com/SuryanshMishra01/Decentralized_Gaming_Tokens/assets/116947777/9ca8e4b9-9c43-4870-a32a-3ba6162f8e04)

Here, the owner is rewarding a gamer by minting 15 DGN tokens at its address.

![image](https://github.com/SuryanshMishra01/Decentralized_Gaming_Tokens/assets/116947777/0b41cffd-673f-47cb-a5b2-a6ee5f7ac324)

The player can check his/her balance using checkBalance().

![image](https://github.com/SuryanshMishra01/Decentralized_Gaming_Tokens/assets/116947777/969bfdd4-7bf3-490f-ae9f-dec215d6319e)

The players can redeem their tokens for in-game NFTs that will be minted on their addresses in exchange of 10 DGN tokens. 

# Author
Suryansh Mishra @suryanshmishra0704@gmail.com

# License
This project is licensed under the Apache License 2.0 - see the LICENSE.md file for details




