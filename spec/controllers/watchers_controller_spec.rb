require 'spec_helper'

describe WatchersController do
  let(:user) { Factory(:confirmed_user) }
  let(:wish_list) { Factory(:wish_list) }

  before do
    sign_in(:user, user)
  end

  describe "#new" do
    it "successfully renders new" do
      get :new
      response.should render_template("new")
    end
  end

  describe "#create" do
    context "with a user that doesn't exist" do
      it "should create a user in the system" do
        post :create, :user => {:email => "example@example.com"}
        User.where(:email => "example@example.com").should be_present
      end

      it "should add the user as a watcher" do
        post :create, :user => {:email => "example@example.com"}
        new_user = User.where(:email => "example@example.com").first
        new_user.should be_in user.watchers
      end

      it "should redirect to wishlists" do
        post :create, :user => {:email => "example@example.com"}
        response.should redirect_to watchers_url
      end
    end

    context "with a user that does exist" do
      let!(:existing_user) { Factory(:confirmed_user) }

      it "should not create a user in the system" do
        expect { post :create, :user => {:email => existing_user.email} }.to_not change {
          User.count
        }
      end
    end
  end

  describe "#show" do
    it "renders the index view" do
      get :index
      response.should render_template("index")
    end
  end
end
