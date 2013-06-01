class ChangePurchasedToPurchasedBy < ActiveRecord::Migration
  def change
    change_column :items, :purchased, :integer
    rename_column :items, :purchased, :purchased_by
  end
end
