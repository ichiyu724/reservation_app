class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user, optional: true

    def total_day
        (check_out - check_in).to_i
    end

    def total_amount
        total_day.to_i * person_num * room.price
    end

end
