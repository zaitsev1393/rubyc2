require 'rails_helper'

RSpec.shared_examples "destroy success" do
  it { expect(subject).to have_http_status 302 }
end

RSpec.describe UsersController do
  let(:user) { create :user }
  let(:non_saved_user) { build :user }

  context "GET #index" do
    subject { get :index }

    it_behaves_like 'success response'
    
    it 'render the index' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @users' do
      new_user = create :user
      get :index
      expect(assigns(:users).last).to eq new_user
    end

  end

  context "GET #show" do
    subject { get :show, params: { id: user.id }}
    
    it_behaves_like "success response"
    
    it 'shows user profile' do
      get :show, params: {id: user.id }
      expect(response).to render_template('show')
      expect(response.body).to include(user.email)
    end

  end

  context "DELETE #destroy" do
    subject { delete :destroy, params: { id: user.id } }

    it_behaves_like "destroy success"

    it 'delete user and redirects to root' do
      expect{ non_saved_user.save }.to change(User, :count).by(1)
      expect { delete :destroy, params: { id: non_saved_user } }.to change(User, :count).by(-1)
      expect(response).to redirect_to root_path
    end

  end

end