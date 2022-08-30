class RoomsController < ApplicationController
  def index
    @rooms = Rooms.all
  end

  def show
  end

  def destroy
    @rooms.destroy
    redirect_to root_path
  end

  def create
  end

  def new
    @rooms = Rooms.new
  end

  def update
  end

  def edit
  end

  def set_rooms
    @rooms = Rooms.find(params[:id])
  end

  def rooms_params
    params.require(:rooms).permit(:name, :user_id)
  end
end
