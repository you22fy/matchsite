class Recruit < ApplicationRecord
    has_many :comments, dependent: :destroy
    NGWORD_REGEX = /(.)\1{4,}/.freeze
    belongs_to :user
    mount_uploader :image, ImageUploader
   
end
