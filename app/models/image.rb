class Image < ApplicationRecord
    has_one_attached :image_blob, dependent: :destroy
    after_validation :is_image?

    def is_image?
        errors.add(:base, 'Please upload your image.') if !self.image_blob.attached?
    end
    # validates :image_blob, presence: true
end
