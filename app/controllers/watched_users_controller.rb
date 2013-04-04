class WatchedUsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @watched_users = current_user.watched_users.all
  end

  def destroy
    @watched_user = current_user.watched_users.find(params[:id])
    @subscription = current_user.outbound_subscriptions.where(:watching_id => @watched_user.id).first

    @subscription.destroy
    flash[:notice] = "#{@watched_user.email} was removed from watchers."
    redirect_to watched_users_path
  end
end


