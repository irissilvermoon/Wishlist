class WatchersController < ApplicationController

  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def create
    #check if user is present in current_user.watchers list
    #if not, add them.
    @user = current_user.watchers.all
    if @user.present?
      redirect_to watchers_path, notice: "#{@user.email} is already a watcher."
    else
      @user = User.invite!(params[:user], current_user)
      current_user.watchers << @user
      redirect_to watchers_path, notice: "#{@user.email} was added as a watcher."
    end
  end

  def index
    @watchers = current_user.watchers.all
  end
end

