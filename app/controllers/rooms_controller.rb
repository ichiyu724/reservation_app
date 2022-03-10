class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:notice] = "ログイン済ユーザーのみ記事の詳細を確認できます" unless user_signed_in?
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end
  
  def create
    @user_id = current_user.id
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to room_path(@room)
    else
      render :new
    end    
  end
  
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservation.room_id = @room.id
  end
  
  def search
    index
    render :index
  end
  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image).merge(user_id: current_user.id)
  end
    

  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
