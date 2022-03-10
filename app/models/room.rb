class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reservations
    belongs_to :user, optional: true

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :address, presence: true
    validates :image, presence: true

end
