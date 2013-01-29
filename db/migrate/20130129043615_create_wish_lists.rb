class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
