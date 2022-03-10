class RenameTotalAmoutColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :total_amout, :total_amount
  end
end
