// SPDX-License-Identifier: BNSL 1.1
pragma solidity ^0.8.10;


// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract TestMinter is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("FakeTurkey", "FTY") {}

    function mintNFT(address recipient) public returns (uint256) {
        _tokenIdCounter.increment();
        uint256 newItemId = _tokenIdCounter.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, "testUri");
        return newItemId;
    }

    function multiMint(address[] memory _recipients, uint256 numberOfTurns)
        public
    {
        for (uint256 i = 0; i < _recipients.length; i++) {
            for (uint256 j = 0; j < numberOfTurns; j++) {
                mintNFT(_recipients[i]);
            }
        }
    }
}

