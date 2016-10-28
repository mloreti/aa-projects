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
