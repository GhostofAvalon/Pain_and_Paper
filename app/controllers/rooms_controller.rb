class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
    #  @character = @room.character
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, status: :see_other
  end

  # def new
  #   @room = Room.new
  # end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to index_path
    else
      render 'index'
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
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :user_id)
  end
end
