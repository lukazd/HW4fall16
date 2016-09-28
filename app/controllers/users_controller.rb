class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def new
  end

  def create
    if !User.exists?(:user_id => params[:user][:user_id])
      @user = User.create_user!(user_params)
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
      redirect_to login_path and return
    else
      flash[:notice] = "Sorry, this user-id is taken. Try again."
      render 'new' and return
    end
  end
end
