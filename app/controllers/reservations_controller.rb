class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end

  def new
    binding.pry
    @reservation = Reservation.new(reservation_params)
    #@room = Room.find(params[:id])
    #@reservation.room_id = @room.id
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end

  end
  
  def show
    
  end
  
  private

  def reservation_params
    binding.pry
    params.require(:reservation).permit(:room_price, :check_in, :check_out, :person_num).merge(user_id: @current_user.id, room_id: @room.id)
  end
  

  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
