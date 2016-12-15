require 'rails_helper'

RSpec.describe PicturesController do
  let(:user) { create :user }

  context "GET #new" do
    it 'build @picture' do
      get :new
      expect(assigns(:picture)).to be_a_new(Picture)
    end
  end

  context "GET #index" do
    subject { get :index }
    it_behaves_like "success response"
  end

  context "POST #create" do
    it "create new picture" do
      @picture = build :picture
      expect {@picture.save}.to change(Picture, :count).by(1)      
    end
  end

  context "GET #show" do
    it 'show picture' do
      @picture = create :picture
      get :show, params: { id: @picture, format: 'js' }
      expect(response.status).to eq 200
    end
  end

  context "GET #subscribe" do
    it 'user subscribes category' do
      @user = create :user
      @picture = create :picture
      3.times do 
        get :subscribe, params: { id: @picture, category_id: @picture.category_id, user_id: @user, format: 'js' }
      end
      expect(@user.categories.size).to eq 1
      expect(@user.categories.last.title).to eq @picture.category.title 
    end
  end

end