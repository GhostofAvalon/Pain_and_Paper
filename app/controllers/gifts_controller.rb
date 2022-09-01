class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    @character = Character.find(params[:character_id])
  end

  def update
    @gift = Gift.find(params[:id])
    @character.gift.update(gift_params)
    redirect_to spells_path
  end

  def add
    @character.gifts << @gift
    consoler.log("Added #{@gift.name} to #{@character.name}")
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :description)
  end
end
