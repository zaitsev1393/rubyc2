class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @pictures = Category.find(params[:id]).pictures.order(:likes_count => :desc).page params[:page]
  end

end
