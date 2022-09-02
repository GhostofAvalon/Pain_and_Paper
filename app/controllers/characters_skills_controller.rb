class CharactersSkillsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @skill = params[:character_skill][:skill_id]
    @character_skill = CharacterSkill.new(characters_skills_params)
    @character_skill.character = @character
    @character_skill.skill_id = @skill
    @character_skill.save
    @n = params[:character_skill][:n].to_i
    @n -= 1
  end

  private

  def characters_skills_params
    params.require(:character_skill).permit(:skill_id, :character_id)
  end
end
