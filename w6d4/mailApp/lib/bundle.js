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

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);
	const Sent = __webpack_require__(4);
	const Compose = __webpack_require__(5);

	$l( ()=>{
	  $l(".sidebar-nav a").on("click", (e)=>{
	    setUrl(e);
	  });

	  $l(".sidebar-nav button").on("click", (e)=>{
	    setUrl(e);
	  });

	  let content = document.querySelector(".content");
	  let router = new Router(content, routes);
	  router.start();
	});

	const routes = {
	  inbox: new Inbox(),
	  sent: new Sent(),
	  compose: new Compose()
	}

	function setUrl(e){
	  target = e.target.innerHTML.toLowerCase();
	  window.location.hash = target;
	}


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor (node, routes) {
	    this.node = node;
	    this.routes = routes;
	  }

	  start() {
	    this.render();
	    window.addEventListener("hashchange", this.render.bind(this));
	  }

	  activeRoute() {
	    return this.routes[window.location.hash.slice(1)];
	  }

	  render() {
	    let component = this.activeRoute();
	    this.node.innerHTML = "";
	    if (component != undefined) {
	      this.node.appendChild(component.render());
	    }
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	class Inbox {
	  render() {
	    let ul = document.createElement("ul");
	    ul.className = "messages";
	    MessageStore.getInboxMessages().forEach( (msg) => {
	      ul.appendChild(this.renderMessage(msg));
	    })
	    return ul;
	  }

	  renderMessage(msg){
	    let li = document.createElement("li");
	    li.className = "message"
	    li.innerHTML = `<span class="from">${msg.from}</span>
	    <span class="subject">${msg.subject}</span>
	    <span class="body">${msg.body}</span>`
	    return li;
	  }
	}

	module.exports = Inbox;


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {};

	messages.sent = [
	  {to: "stevejobs@appple.com", subject: "my computer sucks", body: "please come fix it"},
	  {to: "billgates@outloook.com", subject: "thanks for the computer", body: "you're so nice"},
	  {to: "wozniak@appple.com", subject: "tell steve something for me", body: "I need my computer fixed"}
	];

	messages.inbox = [
	    {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out", body:
	    "Stay at home mom discovers cure for leg cramps. Doctors hate her"},
	  {from: "person@mail.com", subject: "Questionnaire", body: "Take this free quiz win $1000 dollars"}
	]

	function Message(from = "", to = "", subject = "", body = "") {
	  this.from = from
	  this.to = to
	  this.subject = subject
	  this.body = body
	  return {
	    to: this.to,
	    from: this.from,
	    subject: this.subject,
	    body: this.body
	  }
	}

	let messageDraft = new Message();

	let MessageStore = {
	  getInboxMessages: function(){
	    return messages.inbox;
	  },
	  getSentMessages: function(){
	    return messages.sent;
	  },
	  getMessageDraft: function(){
	    return messageDraft;
	  },
	  updateDraftField: function(field, value) {
	    messageDraft[field] = value;
	  },
	  sendDraft: function(){
	    messages.sent.push(messageDraft);
	    messageDraft = new Message();
	  }
	}

	module.exports = MessageStore;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	class Sent {
	  render() {
	    let ul = document.createElement("ul");
	    ul.className = "messages";
	    MessageStore.getSentMessages().forEach( (msg) => {
	      ul.appendChild(this.renderMessage(msg));
	    })
	    return ul;
	  }

	  renderMessage(msg){
	    let li = document.createElement("li");
	    li.className = "message"
	    li.innerHTML = `<span class="to">${msg.to}</span>
	    <span class="subject">${msg.subject}</span>
	    <span class="body">${msg.body}</span>`
	    return li;
	  }
	}

	module.exports = Sent;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3)

	class Compose {
	  render(){
	    let div = document.createElement("div");
	    div.className = "new-message";
	    div.innerHTML = this.renderForm();
	    $l("div").on("change", this.handleChange);
	    $l("div").on("submit", this.sendDraft);
	    return div;
	  }

	  handleChange(e){
	    let name = e.target.name;
	    let value = e.target.value;
	    MessageStore.updateDraftField(name, value);
	  }

	  sendDraft(e) {
	    e.preventDefault();
	    MessageStore.sendDraft();
	    window.location.hash = "inbox";
	  }

	  renderForm(){
	    let draft = MessageStore.getMessageDraft();
	    let form = `<p class='new-message-header'>New Message</p>
	    <form class='compose-form'>
	      <input placeholder='Recipient' name='to' type='type' value='${draft.to}'>
	      <input placeholder='subject' name='subject' type='type' value='${draft.subject}'>
	      <textarea name='body' row='20'>${draft.body}</textarea>
	      <button type='submit' class='btn btn-primary submit-message'>Send</button>
	    </form>`
	    return form;
	  }
	}

	module.exports = Compose;


/***/ }
/******/ ]);