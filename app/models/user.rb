class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :planes, dependent: :destroy
  has_many :bookings, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  has_attached_file :profile_picture,
     styles: { medium: "300x300>", thumb: "100x100>" }

   validates_attachment_content_type :profile_picture,
     content_type: /\Aimage\/.*\z/

  has_attached_file :license_picture,
     styles: { medium: "300x300>", thumb: "100x100>" }

   validates_attachment_content_type :license_picture,
     content_type: /\Aimage\/.*\z/

    # validation firstname
    #validates :firstname, presence: true

    # validation lastname
    #validates :lastname, presence: true

    # validation email
    validates :email, presence: true, uniqueness: true

    after_create :send_welcome_email

    # validation phone_number
    #validates :phone_number, presence: true, uniqueness: true

    # pilot
    #validates :pilot, inclusion: { in: [true, false] }

    # picture
    # validates :profile_picture, presence: true

    # description
    # validates :description, presence: true, allow_blank: true
    private

    def send_welcome_email
        UserMailer.welcome(self).deliver
    end

    def self.find_for_facebook_oauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.name = auth.info.name
        user.picture = auth.info.image
        user.token = auth.credentials.token
        user.token_expiry = Time.at(auth.credentials.expires_at)
      end
    end
end
