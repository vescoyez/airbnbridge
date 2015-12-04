# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bridge.destroy_all
User.destroy_all


10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end

10.times do
  Bridge.create(
    {
      name: Faker::App.name + " Bridge",
      bridge_type: Bridge::BRIDGE_TYPES.sample,
      description: Faker::Lorem.sentence,
      capacity: (1..10).to_a.sample,
      user_id: User.all.sample.id,
      address: "Grand-Place Bruxelles",
      price: [1,2].sample
    }
  )
end
