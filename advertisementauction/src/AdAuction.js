import Web3 from 'web3';
const fs = require('fs');

const contractJson = JSON.parse(fs.readFileSync('./build/contracts/AdAuction.json', 'utf8'));
const contractAbi = contractJson.abi;


const web3 = new Web3('https://sepolia.infura.io/v3/dc1a110c6ff14509981bc71c524165ba'); // Replace with the URL of your Sepolia node

const AdAuctionContract = new web3.eth.Contract(contractAbi, Address); // Replace with the ABI and address of your AdAuction contract
