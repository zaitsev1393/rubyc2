class UsersController < ApplicationController

  def index
    load_users
  end

  def show
    load_user
  end

  def destroy
    destroy_user
  end

private 

  def load_users
    @users = User.all
  end

  def load_user
    @user = User.find(params[:id])
  end

  def destroy_user
    User.find(params[:id]).destroy
  end

end
