class CommentsController < ApplicationController
  before_action :find_picture, :only => [:create]
  before_action :find_comment, :only => [:destroy]

  def index
    @comments = Comment.order(:created_at)
  end

  def show
    @comments = User.find(params[:id]).comments
  end

  def create
    @comment = @picture.comments.create comment_params
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    @comment.destroy
  end

private

  def find_picture
    @picture = Picture.find(params[:picture_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

end
