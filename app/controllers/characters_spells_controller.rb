class CharactersSpellsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @spell = params[:character_spell][:spell_id]
    @character_spell = CharacterSpell.new(characters_spells_params)
    @character_spell.character = @character
    @character_spell.spell_id = @spell
    @character_spell.save
  end

  private

  def characters_spells_params
    params.require(:character_spell).permit(:spell_id, :character_id)
  end
end
