class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :planes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_attached_file :profile_picture,
     styles: { medium: "200x200>", thumb: "100x100>" }

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
    # validation phone_number
    #validates :phone_number, presence: true, uniqueness: true
    # pilot
    #validates :pilot, inclusion: { in: [true, false] }
    # picture
    # validates :profile_picture, presence: true
    # description
    # validates :description, presence: true, allow_blank: true
end
