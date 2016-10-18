/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Bullet = __webpack_require__(1);
	const GV     = __webpack_require__(2);
	const Game   = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./game.js\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	const MO     = __webpack_require__(4);
	const Ship   = __webpack_require__(5);
	const Util   = __webpack_require__(6);


	function Asteroid (pos) {
	  let vel = [Math.round(Math.random() * 10), Math.round(Math.random() * 10)]
	  const COLOR = "dimgrey";
	  const RADIUS = [50,50];
	  MovingObject.call(this, {pos: pos, vel: this.vel,  color: COLOR, radius: RADIUS})
	}

	Util.inherits(Asteroid, MO);


/***/ },
/* 1 */
/***/ function(module, exports) {

	


/***/ },
/* 2 */
/***/ function(module, exports) {

	





	function GameView () {
	  self.game = new Game();


	}


	GameView.prototype.start = function() {
	  
	}


/***/ },
/* 3 */,
/* 4 */
/***/ function(module, exports) {

	


	function MovingObject (options) {
	  this.pos = options.pos;
	  this.vel = options.vel;
	  this.radius = options.radius;
	  this.color = options.color;
	}


	MovingObject.prototype.draw = function (ctx) {

	  ctx.fillStyle = this.color;
	  ctx.beginPath();

	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();

	};

	MovingObject.prototype.move = function (){
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	}


/***/ },
/* 5 */
/***/ function(module, exports) {

	

/***/ },
/* 6 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate(){};
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  }
	}

	module.exports = Util;


/***/ }
/******/ ]);