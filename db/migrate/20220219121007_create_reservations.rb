class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :room_image
      t.string :room_name
      t.string :room_address
      t.text :room_introduction
      t.integer :room_price
      t.datetime :check_in
      t.datetime :check_out
      t.integer :person_num
      t.integer :room_id

      t.timestamps
    end
  end
end
