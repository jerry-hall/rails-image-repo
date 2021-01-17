class AddNameDescriptionToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :name, :string
    add_column :images, :description, :text
  end
end
