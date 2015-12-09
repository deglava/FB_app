class CommentsController < ApplicationController
  def create
    @msg = Timeline.find(params[:msg_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    @reversefriendship = @user.friendships.build(:friend_id => current_user.id)
    @reversefriendship.save
    redirect_to root_url
  end
end
