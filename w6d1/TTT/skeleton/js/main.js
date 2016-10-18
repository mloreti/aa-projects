const View = require("./ttt-view")
const Game = require("../../solution/game")

$( () => {
  let game = new Game();
  let view = new View(game,$(".ttt"));
});
