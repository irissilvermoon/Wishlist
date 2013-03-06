class WishList < ActiveRecord::Base
  attr_accessible :description, :title
  validates :title, :presence => true

  belongs_to :user

  has_many :items, :dependent => :destroy
end
