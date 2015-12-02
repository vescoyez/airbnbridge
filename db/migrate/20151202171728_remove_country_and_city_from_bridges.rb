class RemoveCountryAndCityFromBridges < ActiveRecord::Migration
  def change
    remove_column :bridges, :country, :string
    remove_column :bridges, :city, :string
  end
end
