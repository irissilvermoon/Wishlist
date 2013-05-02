class AddUserNamesToOldUsers < ActiveRecord::Migration
  def change
    User.where(:username => nil).each do |user|
      user.username = user.email.split("@").first
      user.save
    end
  end
end
