// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BasicNftTwo is ERC721 {
    using Strings for uint256;

    string public constant TOKEN_URI = "ipfs://QmdryoExpgEQQQgJPoruwGJyZmz6SqV4FRTX1i73CT3iXn";

    string internal baseURI = "ipfs://QmciivWCFZP7tRQBYg3FkTHaUpg8FLsN2wcWJA8ik7cf2H/";
    string internal uriSuffix = ".json";

    uint256 private s_tokenCounter;

    event DogMinted(uint256 indexed tokenId);

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        emit DogMinted(s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");

        return
            bytes(baseURI).length > 0
                ? string(abi.encodePacked(baseURI, _tokenId.toString(), uriSuffix))
                : "";
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
