class AddDeliveryIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :delivery
  end
end