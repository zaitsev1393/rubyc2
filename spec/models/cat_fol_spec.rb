# == Schema Information
#
# Table name: cat_fols
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CatFol do
  
  before :each do
    @catfol = create :cat_fol
  end

  it { expect(@catfol).to respond_to :user }
  it { expect(@catfol).to respond_to :category }

end
