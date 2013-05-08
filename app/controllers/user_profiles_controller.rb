class UserProfilesController < ApplicationController


  def index

  end

  def show
    @user_profile = current_user.user_profile ||
                    current_user.build_user_profile
  end


  def update
    @user_profile = current_user.user_profile ||
                    current_user.build_user_profile
    @user_profile.attributes = params[:user_profile]
    if @user_profile.save
      flash[:notice] = "Profile has been updated"
      redirect_to user_profile_path
    else
      flash[:alert] = "Profile has not been updated."
      render :action => "Edit"
    end
  end
end