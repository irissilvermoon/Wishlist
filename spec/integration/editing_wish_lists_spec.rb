require 'spec_helper'

feature 'Editing Wish lists' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    Factory(:wish_list, :title => "Wish list 1", :description => "Wish list 1 description")
    visit "/wish_lists"
    click_link "Edit"
  end

  scenario "Editing a wish list" do
    fill_in "Title", :with => "Wish list 2"
    click_button "Update Wish list"
    page.should have_content("Wish list was successfully updated.")
  end


  scenario "Updating a wish list with invalid attributes is bad" do
    fill_in "Title", :with => " "
    click_button "Update Wish list"
    page.should have_content("Wish list has not been updated.")
  end
end