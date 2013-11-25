# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    description "MyText"
    issue nil
    user nil
  end
end
