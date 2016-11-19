class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @pictures = Category.find(params[:id]).pictures.page params[:page]
  end

end
