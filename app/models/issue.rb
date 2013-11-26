# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :text
#  resolved    :integer          default(0)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  anonymous   :boolean          default(FALSE)
#

class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  validates :title, presence: true

  def resolved?
    self.resolved > 0 
  end
end
