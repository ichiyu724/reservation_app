class AddTotalDayToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_day, :string
  end
end
