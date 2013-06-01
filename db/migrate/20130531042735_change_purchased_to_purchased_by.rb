class ChangePurchasedToPurchasedBy < ActiveRecord::Migration
  def change
    remove_column :items, :purchased_by
    add_column :items, :purchased_by, :integer
  end
end
