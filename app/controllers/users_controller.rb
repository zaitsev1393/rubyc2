class UsersController < ApplicationController
  before_action :find_user, :only => [:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = User.find(params[:id]).events
  end

  def destroy
    @user.destroy
  end

private

  def find_user
    @user = User.find(params[:id])
  end

end
