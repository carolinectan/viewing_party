class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.email}!"
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
