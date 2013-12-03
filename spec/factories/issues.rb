# == Schema Information
#
# Table name: issues
#
#  id            :integer          not null, primary key
#  description   :text
#  resolved      :integer          default(0)
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  title         :string(255)
#  anonymous     :boolean          default(FALSE)
#  course_id     :integer
#  instructor_id :integer
#  archived      :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title { Faker::Company.bs }
    description { Faker::Lorem.sentence }
    resolved 0
    anonymous false
  end

  factory :anonymous_issue, :class => :issue do
    title { Faker::Company.bs }
    description { Faker::Lorem.sentence }
    resolved 0
    anonymous true
  end

  factory :user_issue, :class => :issue do 
    title { Faker::Company.bs }
    description { Faker::Lorem.sentence }
    resolved 0
    anonymous false
    user
  end

end
