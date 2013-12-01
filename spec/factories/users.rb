# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    admin false
  end

  factory :student, :class => :user  do
    name { Faker::Name.first_name }
  end

  factory :instructor, :class => :user do
    name { Faker::Name.first_name }
    admin true
  end

  factory :admin, :class => :user do 
    name { "Admin User" }
    admin true
  end

  factory :user_without_name, :class => :user  do 
    github_name "My github name"
  end
end
