# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  permissions :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  has_many :issues
  has_many :responses

  def self.from_omniauth(auth)
     # where(auth.slice("provider", "uid")).first ||
     
    create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      # user.provider = auth["provider"]
      # user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      # user.nickname = auth["info"]["nickname"]
      # user.email = auth["info"]["email"]
      # user.image_gravatar = auth["info"]["image"]
    end
  end 
end
