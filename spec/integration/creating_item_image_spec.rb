require 'spec_helper'

feature "Viewing Items" do
  before do 
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!")
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list, :link => "http://www.flickr.com/photos/irissilvermoon")
  end

  scenario "creating a new image" do
    visit new_wish_list_item_image_path(@wish_list, @item_1)
  end
end