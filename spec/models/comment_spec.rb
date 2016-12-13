require 'rails_helper'

RSpec.describe Comment do

  subject(:comment) { FactoryGirl.create :comment}

  context 'respond to User and Picture' do
    it { expect(comment).to respond_to(:user) }
    it { expect(comment).to respond_to(:picture) }
  end

  it 'is valid' do
    comment.user = FactoryGirl.create :user
    comment.picture = FactoryGirl.create :picture
    expect(comment).to be_valid
  end

end