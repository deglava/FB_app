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
    @newmsg = false
    @timelines = Timeline.find_by_user_id(params[:id])
    @comments = Comment
    @msgs = Privatemsg.where("user_id - ?", @user.id)
    result = Privatemsg.where("rec_id - ? and newmsg = true", @user.id)
    if result = nil
      @newmsg = true
    end

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
  def viewtimeline
    @user = User.find(params[:id])
  end

  def changeStatus
    @user = User.find(params[:id])
    if request.post?
      @user.update_attributes(user_params)
      redirect_to :action=>"home", :id=>current_user
    end
  end

  def addevent
    @user =User.find(params[:id])
    if request.post?
      @time = @user.timelines.build()
      @time.save
      @time = @user.timelines.last
      @msg = @time.comments.build(:msg_id => current_user.id)
      @msg.save
      @msg.update_attributes(time_params)
    end
    # @time = current_user.timelines.build(:post => "Checking posts")
    # @time.save
    redirect_to :action=>"home", :id=>@user.id
  end
  def addcomment
    @timeline =Timeline.find(params[:id])
    if request.post?
      @time = @timeline.comments.build(:timeline_id => params[:id], :msg_id => current_user.id)

      @time.save
      @time.update_attributes(send_params)

    end
    # @time = current_user.timelines.build(:post => "Checking posts")
    # @time.save
    redirect_to :action=>"home", :id=>current_user.id
  end




  def unfriend
    @friend = User.find(params[:friend_id])
    @curr_user_id = current_user.id
    @curr_user = User.find(current_user.id)
    @friendship = @curr_user.friendships.find_by(params[:user_id])
    @friendship.destroy
    @friendship = @friend.friendships.find_by(params[:user_id])
    @friendship.destroy
    redirect_to root_url
  end

  def sendmessage
    @user = User.find(params[:id])




  end
  def submitmsg
    @user = User.find(params[:id])
    @owner = current_user.id

    if request.post?
      @msg = @user.privatemsgs.build(:rec_id =>current_user.id, :msg => send_params, :newmsg => true)
      @msg.save

    end
    # @time = current_user.timelines.build(:post => "Checking posts")
    # @time.save
    redirect_to :action=>"home", :id=>current_user
  end
  def viewmsg
    @user = current_user
    @msgs = Privatemsg
  end

  private
  def send_params
    params.require(:comment).permit(:msg)
  end
  def time_params
    params.require(:timeline).permit(:msg)
  end
  def user_params
    params.require(:user).permit(:Status)
  end
end

