class Course < ActiveRecord::Base
  has_many :issues
  has_many :responses, :through => :issues

  def add_issue(user,issue_hash)
    issue = self.issues.build(issue_hash)
    issue.user = user
    issue
    #returns an unsaved issue, so that the controller can attempt to save it, and then see if there are any errors
  end
end
