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

class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :responses
  has_many :user_notifications
  
  validates_presence_of :title, message: "Issues Must Have A Title."
  scope :resolved, -> { where(:resolved => 1) }
  scope :unresolved, -> { where(:resolved => 0) }
  scope :not_queued, -> { where(:instructor_id => nil) }
  scope :in_instructor_queue, ->(user) { where(:instructor_id => user.id) }
  scope :archived, -> { where(:archived => true) }
  scope :not_archived, -> { where(:archived => false) }

  def resolved?
    self.resolved > 0 
  end

  def resolve!
    self.resolved = 1
    self.save
  end

  def add_response(user,response_hash)
    response = self.responses.build(response_hash)
    response.user = user
    response
  end
  
  def archived?
    self.archived
  end

  # # build an association with issue_notification, in which I set if this user
  # # wants to notified re this issue to true or false

  # def notifications(user,issue_hash, notify_selection)
  #   notify = self.issues.build(issue_hash)
  #   issue.user_notifications(user, issue).notify = notify_selection
  #   issue
  #   #returns an unsaved issue, so that the controller can attempt to save it, and then see if there are any errors
  # end

end
