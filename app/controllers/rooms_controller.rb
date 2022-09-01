class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, status: :see_other
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to rooms_path
    else
      render 'index'
    end
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
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
    params.require(:room).permit(:name, :user_id, :photo)
  end

  def record_not_found
    redirect_to rooms_path
  end
end
