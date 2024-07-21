// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "contracts/myGameAssets.sol";



contract DegenERC20 is ERC20{
   
    struct GameItem{     //Struct to represent game-assets (NFTs). 
        string name;     //Mapping names and prices of unique NFTs.
        string _URI;
        uint price;
    }


GameItem[] public _GameItems;   //Mapping NFTs with unique array indices. 
        

    address private immutable owner;
    uint private CountToken;
    myGameAssets private Degen_GA;

    constructor(uint _initialValue) ERC20("Degen","DGN"){
        owner = msg.sender;
         _mint(msg.sender, _initialValue); 
        Degen_GA = new myGameAssets();

//Initializing Game Assests 
        _GameItems.push(GameItem("Demon Sword","https://ipfs.io/ipfs/QmZrh2QQ3eB4fETn5LQ8WyYxjKLCJQH43iuuWZDd6eYrD7",120));
        _GameItems.push(GameItem("Deadly Poison","https://ipfs.io/ipfs/QmXDoiHqprA1q1RgBAm9hmJPR81zLhbkWcn6GXBWb73QtL",100));
        _GameItems.push(GameItem("Eagle's Arrow","https://ipfs.io/ipfs/QmQEYeCRexZNr5wgGfWoyDoRJfmtyvwSGtYM8nh7PK4dtV",70));
 
    }

    function addGameAsset(string memory _name, string memory _URI , uint price)public onlyOwner{
        _GameItems.push(GameItem(_name,_URI,price));
    }

    function getGameAsset(uint _index)public view returns(string memory, string memory, uint){
        return (_GameItems[_index].name,_GameItems[_index]._URI,_GameItems[_index].price);
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
    function tranfer_Tokens(address _recepient, uint _value) public{
        require(balanceOf(msg.sender) >= _value);
        transfer(_recepient, _value);
       
    }


    //function to redeem 10 Tokens for 1 NFT. 
    function redeem_Tokens(uint _index) public{
        require(balanceOf(msg.sender) >= _GameItems[_index].price,"Not have enough DGN tokens to redeem.");
        
        transfer(address(this), _GameItems[_index].price);
        Degen_GA.mint_Assets(msg.sender,_GameItems[_index].name, _GameItems[_index]._URI);
    }

  


    //function to burn the _value amount of token.
    function burn_Tokens(uint _value) public {
        require( balanceOf(msg.sender) >=_value);
        _burn(msg.sender, _value);
    }
 
}
