class CategoriesController < ApplicationController

  def index
    load_categories
  end

  def show
    load_category
  end

private

  def load_category
    @pictures = Category.find(params[:id]).pictures.order(:likes_count => :desc).page params[:page]
  end

  def load_categories
    @categories = Category.all
  end

end
