class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :bridge, index: true, foreign_key: true
      t.date :checkin_date
      t.date :checkout_date
      t.float :price
      t.references :user, index: true, foreign_key: true
      t.integer :people

      t.timestamps null: false
    end
  end
end
