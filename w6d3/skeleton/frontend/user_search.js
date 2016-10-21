const FollowToggle = require("./follow_toggle");

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
