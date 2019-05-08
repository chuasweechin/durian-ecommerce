class AddDescriptionToDurians < ActiveRecord::Migration[5.2]
  def change
    add_column :durians, :description, :text
  end
end