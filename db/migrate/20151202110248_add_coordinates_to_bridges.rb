class AddCoordinatesToBridges < ActiveRecord::Migration
  def change
    add_column :bridges, :latitude, :float
    add_column :bridges, :longitude, :float
  end
end
