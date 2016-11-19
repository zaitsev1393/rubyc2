class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = User.find(params[:id]).events
  end

end
