class PicturesController < ApplicationController

  def index
    @pictures = Picture.all.page(params[:page])
  end

  def show
    @picture = Picture.find(params[:id])
      @next = @picture == Picture.last ? Picture.first : Picture.find(params[:id].to_i + 1)
      @prev = @picture == Picture.first ? Picture.last : Picture.find(params[:id].to_i - 1)
    @comments = @picture.comments
  end

  def destroy
  end

  def new
  end

end
