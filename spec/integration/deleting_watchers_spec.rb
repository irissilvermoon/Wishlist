require 'spec_helper'

feature 'deleting users from watchers list' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link "Invite User"

    fill_in "Email", :with => "newuser@wishlist.com"
    click_button "Invite"
    page.should have_content("newuser@wishlist.com was added as a watcher.")
  end

  scenario 'Users should be able to delete watchers' do
    click_link "Remove as Watcher"
    page.should have_content("newuser@wishlist.com was removed from watchers.")
    page.current_url.should == watchers_url
  end
end