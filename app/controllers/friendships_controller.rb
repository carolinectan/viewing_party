class FriendshipsController < ApplicationController
  def create
    user = current_user
    friend = User.find_by(email: params[:email])

    Friendship.create!(user_id: user.id, friend_id: friend.id)

    redirect_to dashboard_path
  end
  # private

  # def _params
  #   params.permit(:)
  # end
end
