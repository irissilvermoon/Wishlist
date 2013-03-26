class WatchersController < ApplicationController

  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.invite!(params[:user], current_user)
    current_user.watchers << @user
    redirect_to watchers_path, notice: "#{@user.email} was added as a watcher."
  end

  def index
    @watchers = current_user.watchers.all
  end
end