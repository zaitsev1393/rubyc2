# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  name       :string
#


FactoryGirl.define do
  factory :event do
   # id { SecureRandom.uuid }
    user
  end
end
