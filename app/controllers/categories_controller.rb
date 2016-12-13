class CategoriesController < ApplicationController

  def show
    @pictures = Category.find(params[:id]).pictures.order(:likes_count => :desc).page params[:page]
  end

end
