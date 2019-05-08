class DropProfilesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :profiles do |t|
      t.references :user
      t.text :address
      t.text :phone_number
      t.timestamps
    end
  end
end