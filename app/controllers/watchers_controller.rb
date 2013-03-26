class WatchersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.invite!(params[:user], current_user)
    current_user.watchers << @user
    head :ok
  end
end