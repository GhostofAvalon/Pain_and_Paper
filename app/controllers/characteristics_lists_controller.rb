class CharacteristicsListsController < ApplicationController
  def edit
    @character = Character.find(params[:character_id])
    @characteristics_list = @character.characteristics_list
    @room = @character.room
  end

  def update
    @character = Character.find(params[:character_id])
    new_characteristics_list = CharacteristicsList.create!(characteristics_list_params)
    @character.characteristics_list = new_characteristics_list
    @character.save
    redirect_to character_backgrounds_path(@character)
  end

  private

  def characteristics_list_params
    params.require(:characteristics_list).permit(:force_value, :dexterity_value, :constitution_value,
                                                 :intelligence_value, :wisdom_value, :charisma_value)
  end
end
