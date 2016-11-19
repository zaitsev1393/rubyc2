class CommentsController < ApplicationController
  before_action :find_picture
  before_action :find_comment, :only => [:destroy]

  def show
    @comments = User.find(params[:id]).comments
    @user = User.find(params[:id])
  end

  def create
    @comment = @picture.comments.create(params[:comment].permit(:text))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to picture_path(params[:picture_id])
  end

  def destroy
    @comment.destroy
    redirect_to picture_path(params[:picture_id])
    p params
  end

private

  def find_picture
    @picture = Picture.find(params[:picture_id]) if params[:picture_id]
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
