class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :image, :link, :title
  validates :title, :presence => true

  belongs_to :wish_list
end
