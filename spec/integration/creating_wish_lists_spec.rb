require 'spec_helper'

feature "Creating Wish Lists" do
  before do
    user = Factory(:user, :email => "wishlist@example.com")
    user.confirm!
    visit '/'
    click_link 'New Wish List'
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)
    
    fill_in "Email", :with => "wishlist@example.com"
    fill_in "Password", :with => 'password'
    click_button "Sign in"
    page.should have_content("New Wish List") 
  end

  scenario "It can create a new Wish List" do
    fill_in 'Title', :with => 'New Title'
    fill_in 'Description', :with => "A description of the wish list"
    click_button 'Create Wish list'
    page.should have_content('Wish list was successfully created.')
    wish_list = WishList.last
    page.current_path.should == new_wish_list_item_path(wish_list)
  end

  scenario "Cannot create a Wish List without a name" do
    click_button 'Create Wish list'
    page.should have_content("Wish list has not been created.")
    page.should have_content("Title can't be blank")
  end
end