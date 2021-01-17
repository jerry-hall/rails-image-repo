class Image < ApplicationRecord
    has_one_attached :image_blob, dependent: :destroy
    after_validation :is_image?
    after_validation :has_name?

    # Validate image is attached
    def is_image?
        errors.add(:base, 'Please upload your image.') if !self.image_blob.attached?
    end

    def has_name?
        self.name = self.image_blob.filename if self.name.empty? and self.image_blob.attached?
    end
end
