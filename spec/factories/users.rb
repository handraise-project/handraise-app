# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  admin             :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  uid               :string(255)
#  github_name       :string(255)
#  provider          :string(255)
#  email             :string(255)
#  image_gravatar    :string(255)
#  primary_course_id :integer
#

# # Read about factories at https://github.com/thoughtbot/factory_girl

# FactoryGirl.define do
#   factory :user do
#     name { Faker::Name.first_name }
# <<<<<<< HEAD
#     admin false
#   end

#   factory :student, :class => :user  do
#     name { Faker::Name.first_name }
#   end

#   factory :instructor, :class => :user do
#     name { Faker::Name.first_name }
#     admin true
# =======
#     #admin false
# >>>>>>> add_archiving
#   end

#   factory :admin, :class => :user do 
#     name { "Admin User" }
# <<<<<<< HEAD
#     admin true
# =======
#     #admin true
# >>>>>>> add_archiving
#   end

#   factory :user_without_name, :class => :user  do 
#     github_name "My github name"
#     #admin false
#   end
# end
