class SessionsController < ApplicationController
  def new; end

  def create
    found_user = User.find_by(email: params[:email])
    if found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      flash[:success] = "Welcome, #{found_user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = 'Sorry, your credentials were bad. Try again.'
      # render :login_form
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
