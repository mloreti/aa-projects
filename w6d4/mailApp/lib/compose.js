const MessageStore = require("./message_store")

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
