class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :image, :link, :title
  validates :title, :presence => true

  belongs_to :wish_list

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
    cost = cost.gsub(",", "")
    self[:cost] = cost
  end
end
