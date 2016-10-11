class SubsController < ApplicationController
  before_action :require_moderator, only:[:edit,:destroy]

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def new
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def destroy
    Sub.destroy(params[:id])
    redirect_to subs_url
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    pending_sub = Sub.new(sub_params)

    if pending_sub.valid?
      @sub.update!(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = pending_sub.errors.full_messages
      redirect_to edit_sub_url(@sub)
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def require_moderator
    @sub = Sub.find(params[:id])
    unless current_user.id == @sub.moderator_id
      flash[:error] = ["You must be the moderator to edit or delete."]
      redirect_to subs_url
    end
  end
end
