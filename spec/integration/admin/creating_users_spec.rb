require 'spec_helper'

feature "Creating Users" do
  before do
    visit '/admin'
    fill_in "Email", :with => "admin@example.com"
    fill_in "Password", :with => "password"
    click_button "Login"
  end

  scenario "Creating a new user" do
    click_button "Users"
    fill_in "Email", :with => "newbie@wishlist.com"
    fill_in "Password", :with => "password"
    click_button "Create User"
    page.should have_content("User has been created.")
  end
end