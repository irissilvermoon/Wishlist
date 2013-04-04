class WatchersController < ApplicationController

  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def create
    #check if user is present in current_user.watchers list
    #if not, add them.
    @user = current_user.watchers.where(:email => params[:user][:email]).first
    if @user
      redirect_to watchers_path, notice: "#{@user.email} is already a watcher."
    else
      @user = User.invite!(params[:user], current_user)

      if @user.valid?
        current_user.watchers << @user
        redirect_to watchers_path, notice: "#{@user.email} was added as a watcher."
      else
        redirect_to new_watcher_path, alert: "Email can't be blank"
      end
    end
  end

  def index
    @watchers = current_user.watchers.all
  end

  def destroy
    #find watcher first
    @watcher = current_user.watchers.find(params[:id])

    @watcher.destroy
    flash[:notice] = "#{@watcher.email} was removed from watchers."
    redirect_to watchers_path
  end
end

