class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    #flash[:notice] = "ログイン済ユーザーのみ記事の詳細を確認できます" unless user_signed_in?
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "The room has been successfully registered!"
      redirect_to room_path(@room)
    else
      render new
    end    
  end
  
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservation.room_id = @room.id
    #binding.pry
  end

  private

  def room_params
    params.require(:reservation).permit(:name, :introduction, :price, :address, :image)
  end
  

  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
