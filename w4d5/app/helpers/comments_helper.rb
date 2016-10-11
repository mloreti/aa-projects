module CommentsHelper

  def get_parent_comments(comment)
    return [comment] if comment.parent_comment_id.nil?
    parent = Comment.find(comment.parent_comment_id)
    get_parent_comments(parent) + comment.child_comments
  end

end
