const Bullet = require('./bullet.js');
const GV     = require('./game_view.js');
const Game   = require('./game.js');
const MO     = require('./moving_object.js');
const Ship   = require('./ship.js');
const Util   = require('./utils.js');


function Asteroid (pos) {
  let vel = [Math.round(Math.random() * 10), Math.round(Math.random() * 10)]
  const COLOR = "dimgrey";
  const RADIUS = [50,50];
  MovingObject.call(this, {pos: pos, vel: this.vel,  color: COLOR, radius: RADIUS})
}

Util.inherits(Asteroid, MO);
