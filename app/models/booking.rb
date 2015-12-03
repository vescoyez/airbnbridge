class Booking < ActiveRecord::Base
  belongs_to :bridge
  belongs_to :user
  has_many :comments
end
