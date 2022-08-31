class PagesController < ApplicationController
  before_action :set_character, only: [:update_job]
  def home
    @user = current_user
    @user.status = params[:status]
    @user.save
  end

  def display_job
    @jobs = Job.all
    @user = current_user
  end

  def races_index
    @races = Race.all
    @user = current_user
  end

  def update_race
    @character.race = params[:race]
    @character.save
    redirect_to job_path
  end

  def update_job
    @character.job = params[:job]
    @character.save
    redirect_to characterisics_list_path
  end

  private

  def character_params
    params.require(:character).permit(:job)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
