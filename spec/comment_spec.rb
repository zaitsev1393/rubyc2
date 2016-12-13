require 'rails_helper'

RSpec.describe Comment do

  let(:comment) { FactoryGirl.create(:comment) }

  it 'wat' do
    p '.' * 100
    p comment
    expect(comment).to be_valid
  end 
  
end