class PurchasesController < ApplicationController

  def create
    #write code to find the correct item and add the current user as its purchased_by
    @wish_list = WishList.find(params[:wish_list_id])
    @item = @wish_list.items.find(params[:item_id])
    @item.purchased_by = current_user
    @item.save
    head 200
  end

  #make destroy method for undo
  #set purchased_by to nil
  #change route to :only => [:create, :destroy]
end
