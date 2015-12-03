class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :content
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
