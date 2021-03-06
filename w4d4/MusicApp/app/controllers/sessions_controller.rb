class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      login(@user)
      redirect_to bands_url 
    else
      flash[:errors] = ["We could not log you in"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
