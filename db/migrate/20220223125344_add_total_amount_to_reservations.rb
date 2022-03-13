class AddTotalAmountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_amout, :integer
  end
end
