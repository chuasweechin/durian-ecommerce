class Profiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.text :address
      t.text :phone_number
      t.timestamps
    end
  end
end