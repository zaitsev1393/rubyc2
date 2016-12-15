require 'rails_helper'

RSpec.describe CategoriesController do
  let (:user) { create :user }
  let (:category) {create :category }

  describe "GET #show" do
    subject { get :show, params: { id: category } }
    it_behaves_like 'success response'
  end

end