const MoveError = require("../../solution/moveError")

class View {
  constructor(game, $el) {
    this.game = game;
    this.grid = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", (e) => {
      this.makeMove($(e.currentTarget));
    })
  }

  makeMove($square) {
    let pos = $square.data("pos");
    // this.game.playMove(pos);
    try {
      this.game.playMove(pos);
    } catch (e) {
      if (e instanceof MoveError) {
        alert(e.msg);
      } else {
        throw e;
      }
    }
    if (this.game.currentPlayer === "x") {
      $square.text(this.game.currentPlayer).addClass("x");
    } else {
      $square.text(this.game.currentPlayer).addClass("o");
    }
    if (this.game.isOver()) {
      if (this.game.winner()) {
        alert(`${this.game.winner()} has won!`);
      } else {
        alert('NO ONE WINS!');
      }
    }
  }

  setupBoard() {
    let display = this.game.board.grid;
    let outer = $("<ul>");
    display.forEach((row, i) => {
      row.forEach((el, j) => {
        let square = $("<li class='square'>");
        square.text(el)
        square.data("pos", [i,j])
        outer.append(square);
      });
    })
    this.grid.append(outer);
  }
}

module.exports = View;
