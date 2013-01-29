class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :link
      t.decimal :cost, :precision => 2
      t.text :image
      t.references :wish_list

      t.timestamps
    end
  end
end
