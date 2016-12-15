require 'rails_helper'

RSpec.describe Like do
  before :each do
    @like = create :like
  end

  it { expect(@like).to respond_to :user }
  it { expect(@like).to respond_to :picture }


end