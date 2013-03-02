require 'spec_helper'

feature "Deleting items in wish lists" do
  let!(:user) { Factory(:confirmed_user) }

 before do
    sign_in_as!(user) 
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!")
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list, :link => "http://www.flickr.com/photos/irissilvermoon")
  end

  scenario "deleting items from wish list" do
    visit wish_list_items_path(@wish_list)
    click_link "Delete"
    page.should have_content("Item has been deleted.")
    page.current_url.should == wish_list_items_url(@wish_list)
  end
end