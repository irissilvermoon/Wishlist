require 'spec_helper'

feature "creating wish list items" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!", :user => user)
    visit new_wish_list_item_path(@wish_list)
  end

  scenario "creating items with valid parameters" do
    fill_in "Item", :with => "A new Item!"
    click_button 'Create Item'
    page.should have_content "Item was successfully created."
    page.should have_content "A new Item!"
  end

  scenario "Creating an item with invalid information" do
    fill_in "Item", :with => ""
    click_button "Create Item"
    page.should have_content "Title can't be blank"
  end
end