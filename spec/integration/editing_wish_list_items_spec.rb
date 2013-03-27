require 'spec_helper'

feature "Editing items in wish lists" do
  let!(:user) { Factory(:confirmed_user) }

 before do
    sign_in_as!(user)
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!", :user => user)
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list, :link => "http://www.flickr.com/photos/irissilvermoon")
    visit wish_list_items_path(@wish_list)
    click_link "Edit"
  end

  scenario "editing items from wish list" do
    fill_in "Item", :with => "different title"
    click_button "Update Item"
    page.should have_content("Item was successfully updated.")
  end

  scenario "Updating a Items with invalid attributes is bad" do
    fill_in "Item", :with => " "
    click_button "Update Item"
    page.should have_content("Item has not been updated.")
  end
end