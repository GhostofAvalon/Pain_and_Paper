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
    @character[:room_id] = params[:room_id]
    @character[:race_id] = Race.first.id
    @character[:job_id] = Job.first.id
    @character[:characteristics_list_id] = CharacteristicsList.first.id
    @character[:background_id] = Background.first.id
    if @character.save
      redirect_to set_race_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @character.update(room_params)
    redirect_to @character
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :height, :level, :weight, :gender)
  end
end
