class ChangeWeightColumnNameForOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :weight, :weight_in_kg
  end
end