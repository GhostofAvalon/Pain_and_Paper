class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @character = Character.find(params[:character_id])
    @user = current_user
  end

  def show
    @character = Character.find(params[:character_id])
    @job = Job.find(params[:id])
  end
end
