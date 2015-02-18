class Booking < ActiveRecord::Base
  belongs_to :plane
  belongs_to :user

  # to do add validation
end
