class WishList < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :items, :dependent => :destroy
  belongs_to :user

  validates :title, :presence => true
end
