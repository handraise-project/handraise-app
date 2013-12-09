# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base
  has_many :issues
  has_many :responses, :through => :issues
  validates_presence_of :name, message: "Courses must have a name."
  validates :name, length: {maximum: 20, too_long: "Course names can have no more than 20 characters."}


  def add_issue(user,issue_hash)
    issue = self.issues.build(issue_hash)
    issue.user = user
    issue
    #returns an unsaved issue, so that the controller can attempt to save it, and then see if there are any errors
  end
end
