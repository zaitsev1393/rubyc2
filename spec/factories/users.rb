FactoryGirl.define do
  factory :user do
    id       { SecureRandom.uuid }
    email    { Faker::Internet.email}
    password '111111'
  end
end