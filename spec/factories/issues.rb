# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title {Faker::Company.bs}
    description {Faker::Lorem.sentence}
    resolved 0
    anonymous false
    user
  end
end
