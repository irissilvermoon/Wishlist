require 'spec_helper'

feature "Creating Wish Lists" do
  before do
    visit '/'
    click_link 'New Wish list'
  end

  scenario "It can create a new Wish List" do
    fill_in 'Title', :with => 'New Title'
    fill_in 'Description', :with => "A description of the wish list"
    click_button 'Create Wish list'
    page.should have_content('Wish list was successfully created.')
  end

  scenario "Cannot create a Wish List without a name" do
    click_button 'Create Wish list'
    page.should have_content("Wish list has not been created.")
    page.should have_content("Title can't be blank.")
  end
end