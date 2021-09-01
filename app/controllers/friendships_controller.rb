class FriendshipsController < ApplicationController
  def create
    user = current_user
    friend = User.find_by(email: params[:email])

    if friend == nil
      flash[:error] = 'That user does not exist. Please try again.'
    else
      Friendship.create!(user_id: user.id, friend_id: friend.id)
    end
      redirect_to dashboard_path
  end
  # private

  # def _params
  #   params.permit(:)
  # end
end
