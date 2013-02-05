require 'spec_helper'

feature "Viewing Items" do
  before do 
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!")
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list)
    @item_2 = Factory.create(:item, :title => "A Corgi", :wish_list => @wish_list)

    @item_3 = Factory.create(:item, :title => "A Camero")
  end

  scenario "Listing the Wish List items" do
    visit wish_list_items_path(@wish_list)
    page.should have_content("A Pony")
    page.should have_content("A Corgi")
    page.should_not have_content("A Camero")
  end
end