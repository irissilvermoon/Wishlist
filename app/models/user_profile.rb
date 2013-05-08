class UserProfile < ActiveRecord::Base
  attr_accessible :ZIP, :address1, :address2, :city, :country, :name, :state

  belongs_to :user
end
