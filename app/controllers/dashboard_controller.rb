class DashboardController < ApplicationController
  def index
    @friends = current_user.friends.reload if current_user
  end
end
