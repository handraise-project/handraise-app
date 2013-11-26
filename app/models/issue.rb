class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :responses
  validates_presence_of :title, message: "Issues Must Have A Title."

  def resolved?
    self.resolved > 0 
  end
end
