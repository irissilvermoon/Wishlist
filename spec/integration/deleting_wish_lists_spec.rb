require 'spec_helper'

feature 'Deleting Wish lists' do
  before do
    Factory(:user, :email => "wishlist@example.com")
  end

  scenario "Deleting a wish list" do
    Factory(:wish_list, :title => "something")
    visit '/'
    click_link "Delete"
    page.should have_content("Project has been deleted.")

    visit '/'
    page.should_not have_content("something")
  end
end