class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "The room has been successfully registered!"
      redirect_to :rooms
    else
      render :new
    end

  end
  
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  


end
