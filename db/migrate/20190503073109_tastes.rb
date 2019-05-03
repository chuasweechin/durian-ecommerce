class Tastes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastes do |t|
      t.text :name
      t.timestamps
    end
  end
end