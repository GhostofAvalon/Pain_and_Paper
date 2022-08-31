class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @user = current_user
    @user.status = params[:status]
    @user.save
  end
end
