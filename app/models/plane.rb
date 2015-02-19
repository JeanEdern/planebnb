class Plane < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # validation user id (should unique and present)
  validates :user_id, presence: true

  # validation description (should be present)
  validates :description, presence: true

  # validation seat (should be present and should >0 and <20)
  validates_numericality_of :seat, :on => :create
  validates :seat, presence: true, inclusion: { in: (1..20).to_a, allow_nil: false }

  # validation aeroclub (should be present)
  validates :aeroclub, presence: true
  validates :address, presence: true

  validates :price, presence: true

  # validation available (par défaut true)
  validates :available, inclusion: { in: [true, false] }

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  # voir l'active record lifecycle
  after_validation :geocode, if: :address_changed?
end
