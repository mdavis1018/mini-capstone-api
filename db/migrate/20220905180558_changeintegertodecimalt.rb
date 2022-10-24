class Changeintegertodecimalt < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 9, scale: 2
    change_column :products, :description, :text
    add_column :products, :inventory_num, :integer
  end
end
