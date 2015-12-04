class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def search
  end

  def results
    if params[:search]
      @users = User.search(params[:search])
    else
      @user = User.all
    end
  end

  def home
    @user = User.find(params[:id])
  end

  def viewguest
    @user = User.find(params[:id])
  end

  def addfriend
    @user = User.find(params[:friend_id])
  end

  def create
    @user = User.find(params[:friend_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    @reversefriendship = @user.friendships.build(:friend_id => current_user.id)
    @reversefriendship.save
    redirect_to root_url
  end

  def viewFriends
    @user = User.find(params[:id])
  end

  def changeStatus
    @user = User.find(params[:id])
    if request.post?
      @user.update_attributes(user_params)
      redirect_to :action=>"home", :id=>current_user
    end
  end

  def unfriend
    @curr_user_id = current_user.id
    @curr_user = User.find(current_user.id)
    @friendship = @curr_user.friendships.find_by(params[:user_id])
    @friendship.destroy
    redirect_to root_url
  end

  def sendmessage
    @user = User.find(params[:friend_id])

  end

  private
  def user_params
    params.require(:user).permit(:Status)
  end
end

