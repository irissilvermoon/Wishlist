class ChangeSubscriptionIdFields < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :user_id, :watcher_id
    rename_column :subscriptions, :wish_list_id, :watching_id
  end
end
