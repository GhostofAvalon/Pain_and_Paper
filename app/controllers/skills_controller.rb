class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    @character = Character.find(params[:character_id])
    @character_skill = CharacterSkill.new
    @room = @character.room_id
    @n = rand(1..5)
  end
end
