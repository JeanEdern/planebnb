class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_attached_file :profile_picture,
     styles: { medium: "300x300>", thumb: "100x100>" }

   validates_attachment_content_type :profile_picture,
     content_type: /\Aimage\/.*\z/


  has_attached_file :license_picture,
     styles: { medium: "300x300>", thumb: "100x100>" }

   validates_attachment_content_type :license_picture,
     content_type: /\Aimage\/.*\z/
end
