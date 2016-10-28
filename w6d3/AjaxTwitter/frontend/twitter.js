const FollowToggle = require("./follow_toggle");
const UserSearch = require("./user_search");
const TweetCompose = require("./tweet_compose");

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
