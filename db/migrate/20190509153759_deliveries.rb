class Deliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.text :name
      t.text :email
      t.text :contact_number
      t.text :delivery_comment
      t.text :delivery_address
      t.text :postal_code
      t.text :unit_number
      t.text :delivery_date
      t.text :delivery_time
      t.timestamps
    end
  end
end