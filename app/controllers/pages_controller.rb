class PagesController < ApplicationController

  def home
    @user = current_user
    @user.status = params[:status]
    @user.save
  end
end
