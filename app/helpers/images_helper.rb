module ImagesHelper

  def item_image_url(url, item)
    if item
      wish_list_item_image_path(@wish_list, item, :url => url)
    else
      url
    end
  end
end
