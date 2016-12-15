require 'rails_helper'

RSpec.describe LikesController do
  let(:user) { create :user }

  context "GET #new" do
    it 'likes and redirects' do
      get :new
      expect(assigns(:like)).to be_a_new(Like)
    end
  end

  context "GET #show" do
    it "user liked pictures" do
      @user = create :user
      @like = @user.likes.create attributes_for :like
      get :show, params: { id: @user, picture_id: @like.picture.id }
      expect(@user.likes.count).to eq 1
    end
  end

end