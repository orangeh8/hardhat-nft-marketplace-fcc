// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BasicNftTwo is ERC721 {
    using Strings for uint256;
    string public constant TOKEN_URI =
        "ipfs://QmXmuSenZRnofhGMz2NyT3Yc4Zrty1TypuiBKDcaBsNw9V/1.gif";
    uint256 private s_tokenCounter;

    event DogMinted(uint256 indexed tokenId);

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 1;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        emit DogMinted(s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI;

        // return
        //     bytes(TOKEN_URI).length > 0
        //         ? string(abi.encodePacked(TOKEN_URI, _tokenId.toString()))
        //         : "";
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
