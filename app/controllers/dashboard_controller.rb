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
    @user = User.find(params[:id])
  end
end
