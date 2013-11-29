# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    #admin false
  end

  factory :admin, :class => :user do 
    name { "Admin User" }
    #admin true
  end

  factory :user_without_name, :class => :user  do 
    github_name "My github name"
    #admin false
  end
end
