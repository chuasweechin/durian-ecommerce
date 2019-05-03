class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :weight
      t.decimal :payment_amount
      t.datetime :txn_date
      t.text :txn_id
      t.text :delivery_address
      t.text :order_status
      t.references :user
      t.references :durian
      t.references :cream
      t.references :taste
      t.timestamps
    end
  end
end