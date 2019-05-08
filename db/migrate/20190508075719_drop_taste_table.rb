class DropTasteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :tastes do |t|
      t.text :name
      t.timestamps
    end
  end
end