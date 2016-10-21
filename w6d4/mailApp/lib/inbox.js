const MessageStore = require("./message_store");

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
