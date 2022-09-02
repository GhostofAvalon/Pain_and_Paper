class CharactersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash.notice = exception.message
    redirect_to rooms_path
  end

  def index
    @room = Room.find(params[:room_id])
    @characters = Character.all
  end

  def show
    @room = Room.find(params[:room_id])
    @character = Character.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.notice = 'Character not found'
    redirect_to rooms_path
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to room_path
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
      redirect_to character_races_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @character = Character.find(params[:id])
    if params[:character][:race]
      @character.race_id = params[:character][:race]
      @character.save
      redirect_to character_jobs_path(@character)
    elsif params[:character][:job]
      @character.job_id = params[:character][:job]
      @character.save
      redirect_to edit_character_characteristics_list_path(@character)
    elsif params[:character][:background]
      @character.background_id = params[:character][:background]
      @character.save
      redirect_to character_gifts_path(@character)
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :height, :level, :weight, :gender)
  end
end
