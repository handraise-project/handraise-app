# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permissions    :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  uid            :string(255)
#  github_name    :string(255)
#  provider       :string(255)
#  email          :string(255)
#  image_gravatar :string(255)
#

class User < ActiveRecord::Base
  has_many :issues
  has_many :responses

  # def self.from_omniauth(auth)
  #    # where(auth.slice("provider", "uid")).first ||

  #   create_from_omniauth(auth)
  # end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.github_name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.image_gravatar = auth["info"]["image"]
    end
  end 

  def display_name
    self.name || self.github_name
  end

  def admin?
    true if self.permissions && self.permissions > 0 || false
  end
end
