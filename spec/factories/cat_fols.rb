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

FactoryGirl.define do
  factory :cat_fol do
    # id { SecureRandom.uuid }
    user
    category
  end
end
