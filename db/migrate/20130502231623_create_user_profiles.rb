class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :ZIP
      t.string :country

      t.timestamps
    end
  end
end
