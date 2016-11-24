class PicturesController < ApplicationController

  # def new
  #   @picture = Picture.new
  # end

  def create
    @picture = Picture.new(picture_params) if params
    @picture.save
  end

  def index
    @pictures = Picture.order(:likes_count => :desc).page(params[:page])
    @picture = Picture.new
    @categories = Category.all
  end

  def show
    @picture = Picture.find(params[:id])
     
      # @next = @picture == Picture.last ? Picture.first : Picture.find(params[:id].to_i + 1)
      # @prev = @picture == Picture.first ? Picture.last : Picture.find(params[:id].to_i - 1)
      
      # better way with picture.rb model code in
      @next = @picture == Picture.last ? Picture.first : @picture.next
      @prev = @picture == Picture.first ? Picture.last : @picture.prev

    @comments = @picture.comments
  end

  def destroy
  end

private

  def picture_params
    params.require(:picture).permit(:image, :category_id)
  end

end
