class RemoveCreamAndSweetColumnFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :cream
    remove_reference :orders, :taste
  end
end