class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    @character = Character.find(params[:character_id])
    @character_gift = CharacterGift.new
    @n = rand(1..5)
  end

  def create
    @gift = Gift.find(params[:id])
    @character_gift.character_id = params[:character_id]
    redirect_to spells_path
  end

  def add
    @character.gifts << @gift
    puts "Added #{@gift.name} to #{@character.name}"
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :description)
  end
end
