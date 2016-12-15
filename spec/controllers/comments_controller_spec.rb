require 'rails_helper'

RSpec.describe CommentsController do
  let(:user) { create :user }
  
  context 'GET #index' do
    subject { get :index }
    it_behaves_like "success response"
  
    it 'returns table of comments' do
      @comment = create :comment
      get :index
      expect(response.body).to include(@comment.text)
    end

  end

  context "POST #create" do
   
    it 'create new comment' do
      comment_params = attributes_for(:comment)
      @picture = create :picture
      @picture.comments.create comment_params
      expect{ post :create, params: { :picture_id => @picture, :comment => comment_params, format: 'js' } }.to change(Comment, :count).by(1)
    end
  end

  context "GET #show" do
    it "user comments" do
      @user = create :user
      @comment = @user.comments.create(attributes_for :comment)
      get :show, params: { id: @user }
      expect(@user.comments).to eq [@comment]
    end
  end

  context "DELETE #destroy" do
    it "deletes comment" do
      @comment = build :comment
      expect { @comment.save }.to change(Comment, :count).by(1)
      expect { delete :destroy, params: { id: @comment, format: 'js' } }.to change(Comment, :count).by(-1)
    end
  end

end