class ChangeCostDecimalFormat < ActiveRecord::Migration
  def up
    change_column :items, :cost, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end
