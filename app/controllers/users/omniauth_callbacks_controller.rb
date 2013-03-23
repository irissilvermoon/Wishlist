module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      # raise request.env["omniauth.auth"].to_yaml
      @user = User.find_for_facebook_oauth(env["omniauth.auth"])

      if @user.persisted?
        sign_in @user, :event => :authentication
        flash[:notice] = "Signed in with Facebook successfully."
        redirect_to wish_lists_path
      else
        flash[:alert] = "Could not find user with info: #{env["omniauth.auth"].info.email}"
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_path
      end
    end
  end
end
