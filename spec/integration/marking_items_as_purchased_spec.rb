require 'spec_helper'

feature 'Purchasing items' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    @wish_list = Factory.create(:wish_list, :title => "new title", :description => "description of title!", :user => user)
    @item_1 = Factory.create(:item, :title => "A Pony", :wish_list => @wish_list, :link => "http://www.flickr.com/photos/irissilvermoon")
  end

  scenario 'Marking items as purchased' do
    visit wish_list_items_path(@wish_list)
    page.check('purchased')
  end
end