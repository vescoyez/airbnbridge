class Bridge < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
