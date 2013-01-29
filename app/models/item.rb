class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :image, :link, :title

  belongs_to :wish_list
end
