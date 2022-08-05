// SPDX-License-Identifier: BNSL 1.1
pragma solidity ^0.8.13;


import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";


contract Giveaway{

    address targetNFT;
    //Used to store old winners in case they dont respond to winning.
    address[] previousWinners;
    address owner;
    bool internal locked;
    event ChooseWinner(address winner, uint256 id);


    constructor() {
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }



    function runGiveaway() public onlyOwner returns(uint256) {


    } 

    function transferOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }



}