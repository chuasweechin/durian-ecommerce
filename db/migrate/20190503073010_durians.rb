class Durians < ActiveRecord::Migration[5.2]
  def change
    create_table :durians do |t|
      t.text :name
      t.decimal :price_per_kg
      t.timestamps
    end
  end
end