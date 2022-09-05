class CharactersGiftsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @gift = params[:character_gift][:gift_id]
    @character_gift = CharacterGift.new(characters_gifts_params)
    @character_gift.character = @character
    @character_gift.gift_id = @gift
    @character_gift.save
  end

  private

  def characters_gifts_params
    params.require(:character_gift).permit(:gift_id, :character_id)
  end
end
