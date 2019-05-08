class Sweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.text :name
      t.timestamps
    end
  end
end