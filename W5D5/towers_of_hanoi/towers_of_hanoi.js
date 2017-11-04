const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor () {
    this.stacks = [[1,2,3,4],[],[]];
  }
  run () {
    //Until game over
      //get move from current player
      //make move if valid

    if (this.gameWon()) {
      console.log("You won!");
      reader.close();
    } else {
      let valid = this.isValidMove;
      this.promptMove(this.isValidMove).bind(this);
    }
  }

  promptMove (callback) {
    console.log(this.stacks);
    reader.question ('Please enter the stack number you\'d like to move from: ', function (from) {
      reader.question ('Please enter the stack number you\'d like to move to: ', function (to) {
        callback(from - 1, to - 1);
      });
    });
  }

  isValidMove (from, to) {
    if (this.stacks[from].length === 0) {
      return false;
    }
    if (this.stacks[to].length === 0 || this.stacks[from][0] < this.stacks[to][0]) {
      return true;
    } else {
      console.log(3);
      console.log(this.stacks[to]);
      return false;
    }
  }

  gameWon () {
    return this.stacks[2].length === 4 || this.stacks[1].length === 4;
  }
}

let testGame = new Game();
// testGame.promptMove(function(from, to) {console.log(from); console.log(to);});
// let foo = testGame.isValidMove(0, 1);
console.log(testGame.isValidMove(2, 1));
