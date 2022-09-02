class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
    @character = Character.find(params[:character_id])
    @character_gift = CharacterGift.new
    @n = rand(1..5)
  end
end
