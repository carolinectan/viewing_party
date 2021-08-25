class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def login_form
  end

  def login
# require "pry"; binding.pry
  end

  # private
  # def user_params
  #   params.require(:user).permit(:email, :password_digest)
  # end
end
