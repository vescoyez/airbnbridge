class Bridge < ActiveRecord::Base
  belongs_to :user

  BRIDGE_TYPES = %w(arch viaduct suspension log steel concrete clapped moon movable).sort
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :bridge_type, presence: true, inclusion: { in:  BRIDGE_TYPES }
end

