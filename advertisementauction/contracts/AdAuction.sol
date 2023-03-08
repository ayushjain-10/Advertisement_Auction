pragma solidity ^0.8.0;

contract AdAuction {
    struct Ad {
        string imageLink;
        string text;
        address currentHighestBidder;
        uint currentHighestBid;
    }
    
    Ad public currentAd;
    uint public auctionEndTime;
    
    event AdUpdated(string imageLink, string text, address currentHighestBidder, uint currentHighestBid);
    
    constructor(string memory _imageLink, string memory _text, uint _duration) {
        currentAd = Ad({
            imageLink: _imageLink,
            text: _text,
            currentHighestBidder: address(0),
            currentHighestBid: 0
        });
        auctionEndTime = block.timestamp + _duration;
    }
    
    function bid(string memory _imageLink, string memory _text) public payable {
        require(block.timestamp < auctionEndTime, "Auction has ended.");
        require(msg.value > currentAd.currentHighestBid, "Bid amount is too low.");
        
        currentAd.currentHighestBidder.transfer(currentAd.currentHighestBid); // return the previous highest bid to the previous bidder
        currentAd.currentHighestBidder = msg.sender;
        currentAd.currentHighestBid = msg.value;
        currentAd.imageLink = _imageLink;
        currentAd.text = _text;
        
        emit AdUpdated(_imageLink, _text, currentAd.currentHighestBidder, currentAd.currentHighestBid);
    }
}
