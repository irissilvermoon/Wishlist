class RenamePermissionToSubscription < ActiveRecord::Migration
  def change
    rename_table :permissions, :subscriptions
  end
end
