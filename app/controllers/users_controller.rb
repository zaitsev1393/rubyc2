class UsersController < ApplicationController
  before_action :find_user, :only => [:destroy]

  # def create
  #   @user = User.new(params[:user])
  #   p "#--------{@user.email}"
  #   UserMailer.welcome_email(@user).now if @user.save
  # end

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
