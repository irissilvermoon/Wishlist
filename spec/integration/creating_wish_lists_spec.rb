require 'spec_helper'

feature "Creating Wish Lists" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'New Wish List'
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