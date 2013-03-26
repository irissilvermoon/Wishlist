class Subscription < ActiveRecord::Base
  attr_accessible :created_by
  belongs_to :watcher, :class_name => "User"
  belongs_to :watching, :class_name => "User"
end
