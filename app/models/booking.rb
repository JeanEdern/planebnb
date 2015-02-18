class Booking < ActiveRecord::Base
  belongs_to :plane
  belongs_to :user

  # to do add validation
  validates :user_id, presence: true
  validates :plane_id, presence: true
  validates :people, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
end
