class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :image, :link, :title
end
