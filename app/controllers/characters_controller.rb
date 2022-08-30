class CharactersController < ApplicationController
  def index
  end

  def show

  end

  def destroy
    @Characters.destroy
    redirect_to root_path
  end

  def create
  end

  def update
  end
end
