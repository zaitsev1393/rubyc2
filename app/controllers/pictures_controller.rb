class PicturesController < ApplicationController

  def create
    @picture = Picture.new(picture_params) if params
    @picture.save

    if @picture.save
      @category = Category.find(@picture.category.id)
      @category.users.each do |user|
        UserMailer.image_added(user, @picture).deliver_now
      end
    end
    p '-------date shet created'
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

  end

  def subscribe

    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id]) 
    
    @user.categories << @category unless @user.categories.find_by(id: @category.id)
  
    p "--------#{@user.email} subscribed #{@category.title} category!"
    redirect_to request.referer
  end

  def destroy
  end


private

  def picture_params
    params.require(:picture).permit(:image, :category_id, :url)
  end

end
