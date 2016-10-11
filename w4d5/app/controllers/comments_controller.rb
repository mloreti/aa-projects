class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to sub_post_url(@comment.post.sub_id, @comment.post.id)
    else
      flash[:error] = @comment.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_comment_id)
  end

end
