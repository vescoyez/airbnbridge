class Booking < ActiveRecord::Base
  belongs_to :bridge
  belongs_to :user
end
