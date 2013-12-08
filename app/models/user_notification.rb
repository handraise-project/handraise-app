# == Schema Information
#
# Table name: user_notifications
#
#  id       :integer          not null, primary key
#  notify   :boolean
#  user_id  :integer
#  issue_id :integer
#

class UserNotification < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue
  
end
