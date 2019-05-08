class ChangePricePerKgTypeInDurians < ActiveRecord::Migration[5.2]
  def change
    change_column :durians, :price_per_kg, :integer
  end
end