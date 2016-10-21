const Router = require("./router");
const Inbox = require("./inbox");
const Sent = require("./sent");
const Compose = require("./compose");

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
