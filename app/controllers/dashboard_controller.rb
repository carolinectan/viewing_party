class DashboardController < ApplicationController
  def index
    if current_user
      @friends = current_user.friends.reload
    end
  end
end
