class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
    @character = Character.find(params[:character_id])
    @user = current_user
  end

  def show
    @character = Character.find(params[:character_id])
    @background = Background.find(params[:id])
  end
end
