class Issue < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  has_many :responses
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
    self.instructor_id = nil
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

  def time_words
    t = (Time.now - self.created_at).to_i
    case t
      when 0 then display = ' just now'
      when 1 then display = ' a second ago'
      when 2..59 then display =' ' + t.to_s+' seconds ago' 
      when 60..119 then display = ' a minute ago' #120 = 2 minutes
      when 120..3540 then display = ' ' + (t/60).to_i.to_s+' minutes ago'
      when 3541..7100 then display = ' an hour ago' # 3600 = 1 hour
      when 7101..82800 then display = ' ' + ((t+99)/3600).to_i.to_s+' hours ago' 
      when 82801..172000 then display = ' a day ago' # 86400 = 1 day
      when 172001..518400 then display = ' ' + ((t+800)/(60*60*24)).to_i.to_s+' days ago'
      when 518400..1036800 then display = ' a week ago'
      else display = ' ' + ((t+180000)/(60*60*24*7)).to_i.to_s+' weeks ago'
    end
    self.time_as_words = display
    self.save
  end

end
