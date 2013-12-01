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
#

class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :responses
  
  validates_presence_of :title, message: "Please add a title"
  validates_associated :responses 
  
  def resolved?
    self.resolved > 0 
  end
end
