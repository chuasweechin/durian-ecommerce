class ChangePaymentAmountTypeInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :payment_amount, :integer
  end
end