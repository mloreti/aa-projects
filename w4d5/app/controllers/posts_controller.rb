class PostsController < ApplicationController

  before_action :require_author, only:[:edit,:destroy]

  def index
    redirect_to subs_url
  end

  def show
    @sub = Sub.find(params[:sub_id])
    @post = Post.find(params[:id])
  end

  def new
    @sub = Sub.find(params[:sub_id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to sub_post_url(@post.sub_id, @post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_sub_post_url
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    pending_post = Post.new(post_params)

    if pending_post.valid?
      @post.update!(post_params)
      redirect_to sub_post_url(@post.sub_id, @post)
    else
      flash[:errors] = pending_post.errors.full_messages
      redirect_to edit_sub_post_url(@post.sub_id, @post)
    end
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to sub_url(@post.sub_id)
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:url,:sub_id,:author_id)
  end

  def require_author
    @post = Post.find(params[:id])
    unless current_user.id == @post.author_id
      flash[:error] = ["You must be the author to edit or delete."]
      redirect_to sub_post_url(@post.sub_id, @post)
    end
  end
end
