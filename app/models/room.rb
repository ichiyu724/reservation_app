class Room < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reservations
    belongs_to :user, optional: true
end
