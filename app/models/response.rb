class Response < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user

  def course
    issue.course
  end
end
