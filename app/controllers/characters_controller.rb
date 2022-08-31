class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
  end

  def new
    @room = Room.find(params[:room_id])
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character[:user_id] = current_user.id
    if @character.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :height, :level, :weight, :gender)
  end
end
