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

FactoryGirl.define do
  factory :picture do
  	#id { SecureRandom.uuid }
    image { Faker::Internet.url }
    category
  end
end
