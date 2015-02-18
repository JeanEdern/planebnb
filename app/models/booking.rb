class Booking < ActiveRecord::Base
  belongs_to :plane
  belongs_to :user

  # to do add validation
  validates :user_id, presence: true
  validates :plane_id, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates_numericality_of :people, :on => :create
  validates :people, presence: true, inclusion: { in: (1..20).to_a, allow_nil: false }
end
