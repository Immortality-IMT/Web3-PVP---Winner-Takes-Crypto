pragma solidity ^0.6.0;

contract Game {
    address public player1;
    address public player2;
    uint public betAmount;
    bool public gameOver;
    address public winner;

    constructor(address _player1, address _player2, uint _betAmount) public {
        player1 = _player1;
        player2 = _player2;
        betAmount = _betAmount;
        gameOver = false;
    }

    function play(uint8 _player1Move, uint8 _player2Move) public payable {
        require(!gameOver, "The game is already over.");
        require(msg.value == betAmount, "Incorrect bet amount.");
        player1.transfer(betAmount);
        player2.transfer(betAmount);

        // Determine the winner
        if ((_player1Move == 1 && _player2Move == 3) || (_player1Move == 2 && _player2Move == 1) || (_player1Move == 3 && _player2Move == 2)) {
            winner = player1;
        } else if ((_player2Move == 1 && _player1Move == 3) || (_player2Move == 2 && _player1Move == 1) || (_player2Move == 3 && _player1Move == 2)) {
            winner = player2;
        } else {
            winner = address(0);
        }
        gameOver = true;
    }

    function claimWinnings() public {
        require(gameOver, "The game is not over yet.");
        require(msg.sender == winner, "Only the winner can claim the winnings.");
        winner.transfer(2 * betAmount);
        gameOver = false;
    }
}

