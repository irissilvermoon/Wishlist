class UserProfilesController < ApplicationController

  before_filter :find_user, :only => [:show]
  before_filter :prepare_user_profile

  def index

  end

  def show

  end

  def edit

  end


  def update
    @user_profile.attributes = params[:user_profile]
    if @user_profile.save
      flash[:notice] = "Profile has been updated."
      redirect_to user_profile_path
    else
      flash[:alert] = "Profile has not been updated."
      render :action => "Edit"
    end
  end

  def prepare_user_profile
    @user ||= current_user
    @user_profile = @user.user_profile ||
                    @user.build_user_profile
  end

  def find_user
    @user = current_user.watched_users.where(:id => params[:id]).first
  end
end
