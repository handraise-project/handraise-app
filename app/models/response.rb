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

class Response < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  validates_presence_of :description, message: "Please enter a reply"

  def course
    issue.course
  end
end
