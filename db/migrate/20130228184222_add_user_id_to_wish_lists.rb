class AddUserIdToWishLists < ActiveRecord::Migration
  def change
    add_column :wish_lists, :user_id, :integer
    add_index :wish_lists, :user_id
  end
end
