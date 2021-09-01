class FriendshipsController < ApplicationController
  # def index
  #
  # end
  # def show
  #
  # end
  # def new
  # end
  def create
    user = current_user
    friend = User.find_by(email: params[:email])

    Friendship.create!(user_id: user.id, friend_id: friend.id)

    redirect_to dashboard_path
  end
  # def edit
  #
  # end
  # def update
  #
  # end
  # def destroy
  #
  # end
  # private
  # def _params
  #   params.permit(:)
  # end
end
