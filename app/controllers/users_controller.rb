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
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
