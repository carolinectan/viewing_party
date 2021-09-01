class DashboardController < ApplicationController
  def index
    @user = current_user
    @friends = current_user.friends
  end
end
