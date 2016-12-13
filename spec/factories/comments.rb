FactoryGirl.define do
  factory :comment do
    text { Faker::ChuckNorris.fact }
    user
    picture
  end
end