class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :image, :link, :title
  validates :title, :presence => true

  belongs_to :wish_list
  belongs_to :user

  def link
    if read_attribute(:link) =~ /^https*:\/\//
      read_attribute(:link)
    elsif read_attribute(:link) !=~ /^https*:\/\//
      'http://' + read_attribute(:link)
    else
      nil
    end
  end

  def cost=(cost)
    cost = cost.gsub(/[^0-9.]/, "")
    self[:cost] = cost
  end
end
