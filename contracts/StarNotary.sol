pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract StarNotary is ERC721 {

    struct Star {
        string name;
    }

//  Add a name and a symbol for your starNotary tokens
    string public name = "Star Notary";
    string public symbol = "STN";
//

    mapping(uint256 => Star) public tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;

    function createStar(string _name, uint256 _tokenId) public {
        Star memory newStar = Star(_name);

        tokenIdToStarInfo[_tokenId] = newStar;

        _mint(msg.sender, _tokenId);
    }

// Add a function lookUptokenIdToStarInfo, that looks up the stars using the Token ID, and then returns the name of the star.
    function lookUptokenIdToStarInfo(uint256 _tokenId) public view returns (string) {
        require(bytes(tokenIdToStarInfo[_tokenId].name).length > 0);

        Star memory star = tokenIdToStarInfo[_tokenId];
        return star.name;
    }

//

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender);

        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable {
        require(starsForSale[_tokenId] > 0);

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = ownerOf(_tokenId);
        require(msg.value >= starCost);

        _removeTokenFrom(starOwner, _tokenId);
        _addTokenTo(msg.sender, _tokenId);

        starOwner.transfer(starCost);

        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
        starsForSale[_tokenId] = 0;
      }

// Add a function called exchangeStars, so 2 users can exchange their star tokens...
//Do not worry about the price, just write code to exchange stars between users.
    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        require(bytes(tokenIdToStarInfo[_tokenId1].name).length > 0);
        require(bytes(tokenIdToStarInfo[_tokenId2].name).length > 0);

        address owner1 = ownerOf(_tokenId1);
        address owner2 = ownerOf(_tokenId2);

        _removeTokenFrom(owner1, _tokenId1);
        _removeTokenFrom(owner2, _tokenId2);

        _addTokenTo(owner2, _tokenId1);
        _addTokenTo(owner1, _tokenId2);

    }

//

// Write a function to Transfer a Star. The function should transfer a star from the address of the caller.
// The function should accept 2 arguments, the address to transfer the star to, and the token ID of the star.
//
    function transferStar(address _to, uint256 _tokenId) public {
        require(_to != address(0));

        address owner1 = ownerOf(_tokenId);
        _removeTokenFrom(owner1, _tokenId);
        _addTokenTo(_to, _tokenId);

    }

}
