require 'spec_helper'

feature "Inviting users to Wishlists" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Invite User'
  end

  scenario "Users can invite others to watch their Wishlists" do
    fill_in "Email", :with => "person@wishlist.com"
    click_button "Invite"
    page.should have_content("person@wishlist.com was added as a watcher.")
  end

  scenario "User cannot add user who is already a watcher" do
    fill_in "Email", :with => "person@wishlist.com"
    click_button "Invite"
    page.should have_content("person@wishlist.com was added as a watcher.")
    click_link "Invite User"
    fill_in "Email", :with => "person@wishlist.com"
    click_button "Invite"
    page.should have_content("person@wishlist.com is already a watcher.")
  end
end