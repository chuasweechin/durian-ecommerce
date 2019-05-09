class AddImageUrlToDurians < ActiveRecord::Migration[5.2]
  def change
    add_column :durians, :image_url, :text
  end
end