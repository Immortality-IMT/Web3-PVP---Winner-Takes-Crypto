# Web3 PvP Winner Takes Crypto

PvP, stands for player versus player.

An Eth contract where two parties enter into a contract, they both put some amount of crypto in to play and depending on the outcome of the game, 
the winner takes all the crypto.

What is required?

The kiosk, where players are organized to play.
A player clicks on another player in a list.
Before game commence, a web3 contract is setup for the game, players ante into the game.
Wallets are deducted the ante of the game and locked into the contract.
They enter and play a game of skill, such as Street Fighter 2, Mortal Kombat or Tekkan style game.
The game registers the winner and executes the contract to send all the takings to the winner of the bout.

Here the sol contract is supplied.

The kiosk, the pre-game management, the game and outcome have not been developed.

Happy to take any codes to build such a system. Let's agree on an online version of Capcoms Street Fighter II as a proof of concept.

Contract pvp.sol
========

The contract allows two players to play a game of rock-paper-scissors by calling the play() function and passing in their moves as arguments. The contract then determines the winner and sets the winner variable accordingly. The winner can then call the claimWinnings() function to receive their winnings, which is twice the amount of the bet.

To call the contract's functions from a web program, you could use a library such as web3.js. Call the play() function from a web program:

const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));

// Set the contract address and ABI (generated from the Solidity contract)
const contractAddress = '0x12345...';
const contractABI = [{...}];
const contract = new web3.eth.Contract(contractABI, contractAddress);

// Get the player addresses and bet amount from the form input
const player1Address = document.getElementById('player1Address').value;
const player2Address = document.getElementById('player2Address').value;
const betAmount = document.getElementById('betAmount').value;

// Call the play function
contract.methods.play(player1Move, player2Move).send({
  from: player1Address,
  value: betAmount
})
.then(function(receipt) {
  console.log(receipt);
});

The code sends a transaction to the Ethereum network to call the play() function on the contract, with the player addresses and bet amount provided as input. The transaction is sent from player1Address, and the value field indicates the amount of ETH to send along with the transaction.

Call claimWinnings() function in a similar way, by replacing play() with claimWinnings() and providing the winner's address as the from field.

Potential Games To Develop
--------------------------

- https://github.com/jkneb/street-fighter-css
- https://github.com/simonsablowski/beatemup
- https://github.com/carabus/battleship-online
