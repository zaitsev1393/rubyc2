class LikesController < ApplicationController

  def new
    @like = Like.new
    redirect_to request.referer || '/' 
  end

  def show
    @pictures = []
    @likes = User.find(params[:id]).likes
    @likes.each do |like|
      @pictures << Picture.find(like.picture_id).url
    end
  end

  def create
    @picture = Picture.find(params[:picture_id])

    if @picture.likes.where(:user_id => params[:user_id]).empty?
      @like = Like.new
      @like = @picture.likes.create
      @like.user_id = current_user.id
      @like.picture_url = @picture.url
      p @like
      @like.save
    else
      @picture.likes.where(:user_id => params[:user_id]).destroy_all
    end
    redirect_to request.referer || '/'
  end

end
