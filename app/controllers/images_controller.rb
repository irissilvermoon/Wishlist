class ImagesController < ApplicationController

  def new
    @wish_list = WishList.find(params[:wish_list_id])
    @item = @wish_list.items.find(params[:item_id])
    page = MetaInspector.new(@item.link)
    puts page.document
  end
end
