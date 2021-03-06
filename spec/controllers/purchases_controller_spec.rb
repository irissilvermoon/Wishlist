require 'spec_helper'

describe PurchasesController do
  let!(:user) { Factory(:confirmed_user) }

  let!(:watching_user) do
    u = Factory(:confirmed_user)
    user.watchers << u
    u
  end

  let!(:wish_list) { Factory(:wish_list,
                             :title => "new title",
                             :description => "description of title!",
                             :user => user) }

  let!(:item) { Factory(:item,
                        :title => "A Pony",
                        :wish_list => wish_list,
                        :link => "http://www.flickr.com/photos/irissilvermoon") }

  before do
    sign_in(:user, watching_user)
  end

  describe '#create' do
    it 'should add a purchased to item' do
      post :create, :wish_list_id => wish_list.id, :item_id => item.id
      item.reload.purchased_by.should == watching_user
    end
  end

  describe '#destroy' do
    before do
      item.purchased_by = watching_user
      item.save
    end

    it 'should allow users to undo item purchases' do
      delete :destroy, :wish_list_id => wish_list.id, :item_id => item.id
      item.reload.purchased_by.should == nil
    end
  end
end