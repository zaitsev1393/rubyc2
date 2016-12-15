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

FactoryGirl.define do
  factory :comment do
    #id { SecureRandom::uuid }
    text { Faker::ChuckNorris.fact }
    user
    picture
  end
end
