class SessionsController < ApplicationController
  def create
    user = User.find_by(user_id: params[:user][:user_id], email: params[:user][:email])
    if user
      session[:session_token] = user.session_token
      redirect_to movies_path and return
    else
      flash[:notice] = "Invalid user-id/e-mail combination"
      redirect_to login_path and return
    end
  end

  def destroy
    reset_session
    #session[:session_token] = nil
    redirect_to movies_path
  end
end
