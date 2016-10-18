const Asteroid = require('./asteroids.js');

const DIM_X = 200;
const DIM_Y = 200;
const NUM_ASTEROIDS = 10;

function Game () {
  this.asteroids = [];
  this.bullets = [];
  this.ships = [];

  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < NUM_ASTEROIDS; i++) {
    let ast = new Asteroid([Math.random(DIM_X), Math.random(DIM_Y)]);
    this.asteroids.push(ast)
  }
}
Game.prototype.draw = function(ctx) {
  ctx.clearRect;
  this.asteroids.forEach((ast) => {
    ast.draw();
  })
}

Game.prototype.moveObjects = function() = {
  this.asteroids.forEach((ast) => {
    ast.move();
  })
}
module.exports = Game;
