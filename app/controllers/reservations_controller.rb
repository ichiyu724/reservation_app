class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check, only: [:new]
  
  def index
    @reservations = current_user.reservations
  end

  def new
    @user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room_id = @room.id
    @reservation.room_name = @room.name
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room_id = @room.id
    @reservation.room_name = @room.name
    render "rooms/show" and return if params[:back] || !@reservation.save
    flash[:notice] = "予約が完了しました"
    redirect_to reservation_path(@reservation)
  end
  
  def show
    @reservation = Reservation.find_by(id: params[:id])
  end
  
  
  
  private

  def reservation_params
    params.require(:reservation).permit(:room_price, :check_in, :check_out, :person_num, :room_id, :room_name, :user_id, :room_introduction, :room_image).merge(user_id: current_user.id, room_id: @room.id)
  end
  
  def check
    @user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.check_in.nil? || @reservation.check_out.nil? || @reservation.person_num.nil?
      redirect_to room_path(@room)
      flash[:notice] = "必須項目を入力してください"
    elsif @reservation.check_in < Date.current
      redirect_to room_path(@room)
      flash[:notice] = "開始日は今日以降を選択してください"
    elsif @reservation.check_out < @reservation.check_in
      redirect_to room_path(@room)
      flash[:notice] = "終了日は開始日以降を選択してください"
    end
  end

  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
