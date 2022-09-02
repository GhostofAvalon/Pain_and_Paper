class SpellsController < ApplicationController
  def index
    @spells = Spell.all
    @character = Character.find(params[:character_id])
    @character_spell = CharacterSpell.new
    @n = rand(1..5)
  end
end
