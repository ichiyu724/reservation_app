class ChangeDatatypeCheckOutOfReservations < ActiveRecord::Migration[6.1]
  def up
    change_column :reservations, :check_out, :date, using: "check_out::date"
  end

  def down 
    change_column :reservations, :check_out, :datetime, using: "check_out::datetime"
  end
end
