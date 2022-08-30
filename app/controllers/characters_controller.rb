class CharactersController < ApplicationController
  def index
    @room = Room.find(params[:rooms_id])
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @room = @character.room
  end

  def destroy
    @Character.destroy
    redirect_to root_path
  end

  def create
    @character.save
    redirect_to @character
  end

  def update
    @character.update(room_params)
    redirect_to @character
  end
end

# def create
#   if @character.save
#     redirect_to @character
#   # else
#   #   render 'new'
#   # end
# end

#   def update
#     if @character.update(room_params)
#       redirect_to @character
#   #   else
#   #     render 'edit'
#   #   end
#   # end
# end
