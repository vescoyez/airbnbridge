class Bridge < ActiveRecord::Base
  belongs_to :user

  BRIDGE_TYPES = %w(arch viaduct suspension log steel concrete clapped moon movable).sort
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, uniqueness: true
  validates :bridge_type, presence: true, inclusion: { in:  BRIDGE_TYPES }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true
end

