require 'spec_helper'

describe WatchersController do
  let(:user) { Factory(:confirmed_user) }
  let(:wish_list) { Factory(:wish_list) }

  describe "#new" do
    it "successfully renders new" do
      sign_in(:user, user)
      get :new
      response.should render_template("new")
    end
  end
end
