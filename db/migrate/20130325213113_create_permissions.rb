class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :wish_list_id
      t.integer :user_id
      t.integer :created_by

      t.timestamps
    end
  end
end
