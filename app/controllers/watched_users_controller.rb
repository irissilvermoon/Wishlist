class WatchedUsersController < ApplicationController

  before_filter :authenticate_user!

   def index
    @watched_users = current_user.watched_users.all
  end
end
