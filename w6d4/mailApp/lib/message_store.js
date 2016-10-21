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
