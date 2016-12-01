class CommentsController < ApplicationController
  before_action :find_picture
  before_action :find_comment, :only => [:destroy]

  def index
    @comments = Comment.order(:created_at)
  end

  def show
    @comments = User.find(params[:id]).comments
    @user = User.find(params[:id])
  end

  def create
    @comment = @picture.comments.create(params[:comment].permit(:text))
    @comment.user_id = current_user.id
    if @comment.save
      Resque.enqueue(Sleeper, 5)
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end

  end

private

  def find_picture
    @picture = Picture.find(params[:picture_id]) if params[:picture_id]
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
