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
