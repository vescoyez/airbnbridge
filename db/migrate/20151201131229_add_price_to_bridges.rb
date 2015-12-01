class AddPriceToBridges < ActiveRecord::Migration
  def change
    add_column :bridges, :price, :float
  end
end
