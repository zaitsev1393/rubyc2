# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  url         :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  likes_count :integer          default(0)
#  image       :string
#

require 'rails_helper'

RSpec.describe Picture do

  before :each do
    @picture = create :picture
  end

  it { expect(@picture).to respond_to :category }
  it { expect(@picture).to respond_to :comments }
  it { expect(@picture).to respond_to :likes }

end
