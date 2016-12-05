require 'rails_helper'

RSpec.describe 'User' do
  it 'must do this' do
    comment = FactoryGirl.create(:comment)
    expect(comment.text).to eq '123'
  end
  it 'must say me' do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq 'email1@gmail.com' 
  end
end 