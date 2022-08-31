class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @user = current_user
    # if @user.status == true
    #   redirect_to gm_path
    # else
    #   redirect_to player_path
    # end
  end
end
