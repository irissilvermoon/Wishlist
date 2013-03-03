require 'spec_helper'

feature "Viewing Items" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user) 
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!", :user => user)
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list, :link => "http://www.flickr.com/photos/irissilvermoon")
  end

  scenario "creating a new image" do
    visit new_wish_list_item_image_path(@wish_list, @item_1)
    click_link "choose image"

    @item_1.reload.image.should == "http://geo.yahoo.com/f?s=792600013&t=b36314aaf7240374a758f1a7344c518d&fl_ev=0&lang=en&intl=us"
    page.current_url.should == wish_list_item_url(@wish_list, @item_1)
  end
end