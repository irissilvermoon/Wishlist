require 'spec_helper'

describe WishListsController do
  let(:user) { Factory(:confirmed_user) }
  let(:wish_list) { Factory(:wish_list) }
  let(:item) { Factory(:item, :wish_list => wish_list,
                       :user => user) }

  context "standard users" do
    it "cannot access a ticket for a project" do
      sign_in(:user, user)
      request.env["HTTP_REFERER"] = root_path
      get :show, :id => wish_list.id, :wish_list_id => wish_list.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The wish list you were looking for could not be found.")
    end
  end
end