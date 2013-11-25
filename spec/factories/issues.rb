# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    description {Faker::Lorem.sentence}
    resolved 1
    user nil
  end
end
