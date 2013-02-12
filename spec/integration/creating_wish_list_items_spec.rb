require 'spec_helper'

feature "creating wish list items" do
  before do
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!")
    visit new_wish_list_item_path(@wish_list)
  end

  scenario "creating items with valid parameters" do
    fill_in "Title", :with => "A new Item!"
    click_button 'Create Item'
    page.should have_content "Item was successfully created."
    page.should have_content "Listing items"
  end

  scenario "Creating an item with invalid information" do
    fill_in "Title", :with => ""
    click_button "Create Item"
    page.should have_content "Title can't be blank"
  end
end