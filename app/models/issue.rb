# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  description :text
#  resolved    :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  def resolved?
    self.resolved > 0 
  end
end
