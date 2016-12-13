class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.order(:likes_count => :desc).page(params[:page])
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      @category = Category.find(@picture.category.id)
      @category.users.each { |user| UserMailer.image_added(user, @picture).deliver_now }
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def subscribe
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])     
    @user.categories << @category unless @user.categories.find_by(id: @category.id)
    redirect_to request.referer
  end

private

  def picture_params
    params.require(:picture).permit(:image, :category_id, :url)
  end
  
end
