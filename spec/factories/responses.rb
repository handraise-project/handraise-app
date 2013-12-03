# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  description :text
#  issue_id    :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    description "MyText"
    issue nil
    user nil
  end
end
