require 'spec_helper'

feature 'Deleting Wish lists' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    Factory(:wish_list, :title => "Wish list 1", :description => "Wish list 1 description", :user => user)
  end

  scenario "Deleting a wish list" do
    visit "/wish_lists"
    click_link "Delete"
    page.should have_content("Wish list has been deleted.")
    page.current_url.should == wish_lists_url
  end
end