require 'rails_helper'

RSpec.describe EventsController do
  let (:user) { create :user }

  context "GET #index" do
    it 'return all events' do
      @event = create :event
      get :index
      expect(assigns(:events)).to eq [@event]
    end
  end

end