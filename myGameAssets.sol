// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract myGameAssets is ERC721URIStorage {

    uint256 public TokenCount = 0;
    mapping(address => string[]) public mintedAssets;

    constructor() ERC721("Unique Game Assets", "UGA") {}

    function mint_Assets(address to, string memory name, string memory _URI) public {
        TokenCount++;
        _mint(to, TokenCount);
        _setTokenURI(TokenCount, _URI);

        string memory meta_Asset = string(abi.encodePacked("\n",name, " : ", _URI));
        mintedAssets[to].push(meta_Asset);
        
    }

    function show_Assets(
        address _myAddress
    ) public view returns (string[] memory) {
        return mintedAssets[_myAddress];
    }
}