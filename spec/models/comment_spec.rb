# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string
#  user_id    :integer
#  picture_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment do

  let(:comment) { create :comment }
  let(:user) { create :user }
  let(:picture) {create :picture } 

  context 'respond to User and Picture' do
    it { expect(comment).to respond_to(:user) }
    it { expect(comment).to respond_to(:picture) }
  end

  it 'is valid' do
    comment.user = user
    comment.picture = picture
    expect(comment).to be_valid
  end

end
