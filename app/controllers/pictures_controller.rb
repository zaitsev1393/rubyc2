class PicturesController < ApplicationController

  def new
    build_picture
  end

  def index
    load_pictures
  end

  def create
    build_picture
    send_notification if save_picture
  end

  def show
    load_picture
  end

  def subscribe
    load_user
    category_subscribe
    redirect_to request.referer
  end

private

  def load_pictures
    @pictures = Picture.order(:likes_count => :desc).page(params[:page])
    @categories = Category.all
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

  def build_picture
    @picture = Picture.new(picture_params)
  end

  def picture_params
    params.require(:picture).permit(:image, :category_id, :url)
  end

  def save_picture
    @picture.save
  end

  def send_notification
    @category = Category.find(@picture.category.id)
    @category.users.each { |user| UserMailer.image_added(user, @picture).deliver_now }
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def category_subscribe
    @category = Category.find(params[:category_id])     
    @user.categories << @category unless @user.categories.find_by(id: @category.id)
  end

  # @next = @picture == Picture.last ? Picture.first : @picture.next
  # @prev = @picture == Picture.first ? Picture.last : @picture.prev

end
