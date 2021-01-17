class Image < ApplicationRecord
    has_one_attached :image_blob, dependent: :destroy
    after_validation :is_image?

    # Validate image is attached
    def is_image?
        errors.add(:base, 'Please upload your image.') if !self.image_blob.attached?
    end
end
