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

  factory :user_without_name, :class => :user  do 
    permissions 0
    github_name "My github name"
  end
end
