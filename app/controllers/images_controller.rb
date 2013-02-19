class ImagesController < ApplicationController

  def new
    @wish_list = WishList.find(params[:wish_list_id])
    @item = @wish_list.items.find(params[:item_id])
    @page = MetaInspector.new(@item.link)
    @images = @page.images
  end

  def create
    @wish_list = WishList.find(params[:wish_list_id])
    @item = @wish_list.items.find(params[:item_id])
    @item.image = params[:url]
    @item.save
    
    redirect_to wish_list_item_path(@wish_list, @item)
  end
end
