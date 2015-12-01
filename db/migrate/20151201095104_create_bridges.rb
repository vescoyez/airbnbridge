class CreateBridges < ActiveRecord::Migration
  def change
    create_table :bridges do |t|
      t.string :name
      t.string :bridge_type
      t.text :description
      t.integer :capacity
      t.references :user, index: true, foreign_key: true
      t.string :country
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
