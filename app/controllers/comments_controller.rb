class CommentsController < ApplicationController
  before_action :find_comment, :only => [:destroy]

  def index
    load_comments
  end

  def show
    load_comment
  end

  def create
    @comment = @picture.comments.create! comment_params
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    destroy_comment
  end

private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def load_comments
    @comments = Comment.order(:created_at)
  end

  def load_comment
    @comments = User.find(params[:id]).comments
  end

  def destroy_comment
    @comment.destroy
  end

end
