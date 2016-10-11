class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )

    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash[:errors] = ['Incorrect Login']
      render :new
    end

  end

  def destroy
    if current_user
      logout!(current_user)
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email,:password)
  end
end
