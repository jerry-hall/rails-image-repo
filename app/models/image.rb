require 'aws-sdk-rekognition'
class Image < ApplicationRecord
    has_one_attached :image_blob, dependent: :destroy
    after_validation :is_image?
    after_validation :has_name?
    after_validation :generate_tags_with_rekognition

    # Validate image is attached
    def is_image?
        errors.add(:base, 'Please upload your image.') if !self.image_blob.attached?
    end

    def has_name?
        self.name = self.image_blob.filename if self.name.empty? and self.image_blob.attached?
    end

    def generate_tags_with_rekognition
        if !self.analyze_with_rekognition
            return
        end

        if !ENV['AWS_ACCESS_KEY_ID'] or !ENV['AWS_SECRET_ACCESS_KEY']
            error_msg   =  "Cannot analyze with AWS Rekognition: AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY 
                            not configured. Please configure these in your environment variables or
                            deselect Analyze with AWS Rekognition."
            errors.add(:base, error_msg)
            return 
        end

        region = "us-east-1"

        credentials = Aws::Credentials.new(
           ENV['AWS_ACCESS_KEY_ID'],
           ENV['AWS_SECRET_ACCESS_KEY']
        )
        client   = Aws::Rekognition::Client.new(credentials: credentials, region: 'us-east-1')
        file = convert_to_base_64(self.image_blob)      # TODO: Implement convert_to_base_64 helper
        attrs = {
        image: {
            bytes: file
        },
        max_labels: 10
        }
        response = client.detect_labels attrs
        
        # Append response to tags
        self.tags = ""
        response.labels.each do |label|
            self.tags += "#{label.name} "
        end
    end
end
