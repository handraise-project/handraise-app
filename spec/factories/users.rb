# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    permissions 0
  end

  factory :admin, :class => :user do 
    name { "Admin User" }
    permissions 10
  end
end
