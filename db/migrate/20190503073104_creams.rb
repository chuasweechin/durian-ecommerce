class Creams < ActiveRecord::Migration[5.2]
  def change
    create_table :creams do |t|
      t.text :name
      t.timestamps
    end
  end
end