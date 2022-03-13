class ChangeDatatypeCheckInOfReservations < ActiveRecord::Migration[6.1]
  def up
    change_column :reservations, :check_in, :date, using: "check_in::date"
  end

  def down 
    change_column :reservations, :check_in, :datetime, using: "check_in::datetime"
  end
end
