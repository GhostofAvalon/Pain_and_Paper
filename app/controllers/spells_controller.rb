class SpellsController < ApplicationController
  def index
    @spells = Spell.all
    @character = Character.find(params[:character_id])
    @room = @character.room
    @character_spell = CharacterSpell.new
  end
end
