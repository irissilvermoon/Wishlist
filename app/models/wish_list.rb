class WishList < ActiveRecord::Base
  attr_accessible :description, :title
  validates :title, :presence => true

  has_many :items, :dependent => :destroy
end
