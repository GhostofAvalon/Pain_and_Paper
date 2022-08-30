class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @character = @room.character
  end

  def destroy
    @room.destroy
    redirect_to root_path, status: :see_other
  end

  def create
    @room = Room.new(room_params)
    @room[:room_name] = Room.new(room_params)
    @room[:user_id] = current_user.id
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @room.update(room_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:rooms).permit(:name, :user_id)
  end
end
