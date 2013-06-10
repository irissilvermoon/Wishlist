class ImagesController < ApplicationController

  def new
    if params[:wish_list_id] && params[:item_id]
      @wish_list = WishList.find(params[:wish_list_id])
      @item = @wish_list.items.find(params[:item_id])
      @url = @item.link
    else
      @url = params[:url]
    end

    @page = MetaInspector.new(@url)
    @images = @page.images

    render :layout => nil unless @item
  end

  def create
    @wish_list = WishList.find(params[:wish_list_id])
    @item = @wish_list.items.find(params[:item_id])
    @item.image = params[:url]
    @item.save

    redirect_to wish_list_item_path(@wish_list, @item)
  end
end
