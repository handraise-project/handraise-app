class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :responses
  validates_presence_of :title, message: "Issues Must Have A Title."
  scope :resolved, -> { where(:resolved => 1) }
  scope :unresolved, -> { where(:resolved => 0) }
  scope :not_queued, -> { where(:instructor_id => nil) }

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

end
