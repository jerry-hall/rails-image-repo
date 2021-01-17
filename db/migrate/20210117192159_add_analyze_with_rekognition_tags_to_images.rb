class AddAnalyzeWithRekognitionTagsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :analyze_with_rekognition, :boolean
    add_column :images, :tags, :string
  end
end
