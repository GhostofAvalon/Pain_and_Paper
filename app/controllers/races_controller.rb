class RacesController < ApplicationController
  def index
    @races = Race.all
    @character = Character.find(params[:character_id])
    @user = current_user
  end

  def show
    @character = Character.find(params[:character_id])
    @race = Race.find(params[:id])
  end
end
