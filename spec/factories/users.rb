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

FactoryGirl.define do

  factory :student, :class => :user  do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    email { Faker::Internet.email }
  end

  factory :instructor, :class => :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}"}
    admin true
  end
end
