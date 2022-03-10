class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :reservations
  attachment :icon_image_id
  mount_uploader :icon_image, ImageUploader

  validates :username, presence: true
end
