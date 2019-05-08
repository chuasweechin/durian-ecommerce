class AddCreamAndSweetToDurians < ActiveRecord::Migration[5.2]
  def change
    add_reference :durians, :cream
    add_reference :durians, :sweet
  end
end