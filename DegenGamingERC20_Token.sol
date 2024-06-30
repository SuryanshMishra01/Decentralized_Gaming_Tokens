// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "contracts/myGameAssets.sol";

contract DegenERC20 is ERC20{

    address private immutable owner;
    uint private CountToken;
    myGameAssets private Degen_GA;

    constructor(uint _initialValue) ERC20("Degen","DGN"){
        owner = msg.sender;
         _mint(msg.sender, _initialValue); 
        Degen_GA = new myGameAssets();
    }

    modifier onlyOwner{    //modifier to check the owner is calling certain function.
        require(owner == msg.sender,"Only Owner can call this function");
        _;
    }   


    //function to reward a certain user by _value amount of tokens, only callable by the owner.
    function mint_Tokens(address to,uint _value) public onlyOwner{
        _mint(to, _value);
    }


    //function to check the token-balance of caller's account.
    function checkBalance() public view returns(uint){
        return balanceOf(msg.sender);
    }


    //function to transfer token to other accounts (Gamer friends).
    function tranferTokens(address _recepient, uint _value) public{
        require(balanceOf(msg.sender) >= _value);
        transfer(_recepient, _value);
       
    }


    //function to redeem 10 Tokens for 1 NFT. 
    function redeem_Tokens(string memory _assetName,string memory _assetURI ) public{
        require(balanceOf(msg.sender) >= 10,"Not have enough DGN tokens to redeem.");
        
        transfer(owner, 10);
        Degen_GA.mint_Assets(msg.sender,_assetName, _assetURI);
    }


    //function to burn the _value amount of token.
    function burnToken(uint _value) public {
        require( balanceOf(msg.sender) >=_value);
        _burn(msg.sender, _value);
    }
 
}