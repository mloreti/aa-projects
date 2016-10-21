/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	const UserSearch = __webpack_require__(2);
	const TweetCompose = __webpack_require__(3);
	
	$(() => {
	  $("button.follow-toggle").each((index, el) => {
	    new FollowToggle($(el));
	  })
	  $("nav.users-search").each((index, el) => {
	    new UserSearch($(el));
	  })
	
	  $(".tweet-compose").each((index, el) => {
	    new TweetCompose($(el));
	  })
	})


/***/ },
/* 1 */
/***/ function(module, exports) {

	class FollowToggle {
	  constructor($el){
	    this.userId = $el.data("user-id");
	    this.followState = $el.data("follow-state");
	    this.el = $el;
	    this.render();
	    this.el.on("click", this.handleClick.bind(this));
	  }
	
	  render (){
	    this.el.prop("disabled", false);
	    if (this.followState === "followed") {
	      this.el.html("unfollow");
	    } else {
	      this.el.html("follow");
	    }
	  }
	
	  toggleState(){
	    if (this.followState === "unfollowed"){
	      this.followState = "followed";
	    } else {
	      this.followState = "unfollowed";
	    }
	    this.render();
	  }
	
	  handleClick (e){
	    const that = this;
	    $(e.target).prop("disabled", true);
	    e.preventDefault();
	    $.ajax({
	      url: `/users/${that.userId}/follow`,
	      type: (that.followState === "followed" ? "DELETE" : "POST"),
	      dataType: "json",
	      success(){
	
	        that.toggleState();
	      }
	    })
	  }
	}
	
	module.exports = FollowToggle;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	
	class UserSearch {
	  constructor($el){
	    this.el = $el;
	    this.ul = $(".users");
	    this.input = $(".users-search input[type=text]")
	    this.input.on("keydown", this.handleInput.bind(this));
	  }
	
	  handleInput (e) {
	    // let input = $(e.target).serialize();
	    const that = this;
	    let input = (e.key === "Backspace" ? this.deleteLast(e.target.value) : e.target.value + e.key);
	    $.ajax({
	      url: "/users/search",
	      type: "GET",
	      dataType: "json",
	      data: {query: input},
	      success(users){
	        that.addUsers(users);
	      }
	    })
	  }
	
	
	  addUsers(users){
	    this.ul.children().remove();
	    users.forEach(user => {
	      let button = $(`<button class='follow-toggle' data-user-id='${user.id}' data-follow-state='${user.followed ? "followed" : "unfollowed"}' ></button>`);
	      new FollowToggle(button);
	      let link = $(`<li><a href='users/${user.id}'>${user.username}</a> </li>`);
	      link.append(button);
	      this.ul.append(link);
	    })
	  }
	
	  deleteLast (str) {
	    str = str.split("");
	    str.pop()
	    return str.join("");
	  }
	}
	
	
	module.exports = UserSearch;


/***/ },
/* 3 */
/***/ function(module, exports) {

	class TweetCompose {
	  constructor(el){
	    this.el  = el;
	    this.ul = $("#feed")
	    this.el.on("submit", this.handleTweet.bind(this));
	    this.counter = 140;
	    $(".content").on("keyup", this.charCount.bind(this));
	    $("a.add-mentioned-user").on("click", this.addMentionUser.bind(this));
	  }
	
	  addMentionUser (e) {
	    e.preventDefault();
	    let script = $(".mention-script").html();
	    $(".mentioned-users").append(script);
	  }
	
	  handleTweet(e) {
	    const that = this;
	    e.preventDefault();
	    $.ajax({
	      url: "/tweets",
	      type: "POST",
	      dataType: "json",
	      data: $(e.target).serialize(),
	      success(tweet){
	        that.el[0].reset();
	        that.addTweet(tweet);
	        $(".mentioned-users").children().remove();
	      }
	    })
	  }
	
	  charCount (e){
	    if (e.key === "Backspace") {
	      if (this.counter >= 0) {
	        this.counter += 1;
	      }
	    } else {
	      this.counter -= 1
	    }
	    if (this.counter < 0) {
	      console.log("test");
	      this.counter = 0;
	      e.target.value = (this.deleteLast(e.target.value));
	    }
	
	    if (this.counter > 140) {
	      this.counter = 140;
	    }
	    $(".chars-left").text(`Character left: ${this.counter}`)
	    // console.log(e.target.value.length+1);
	  }
	
	  deleteLast (str) {
	    str = str.split("");
	    str.pop()
	    return str.join("");
	  }
	
	  addTweet(tweet){
	    let newTweet = $(`<li>${tweet.content}
	      -- <a href='/users/${tweet.user.id}'>${tweet.user.username}</a>
	      -- ${tweet.created_at}</li>`);
	      if (tweet.mentions.length > 0) {
	        tweet.mentions.forEach((mention) => {
	          let newMention = $(`<ul><li><a href='/users/${mention.id}'>${mention.user.username}</a></li></ul>`)
	          newTweet.append(newMention);
	        })
	      }
	    this.ul.prepend(newTweet);
	  }
	
	
	}
	
	module.exports = TweetCompose;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map