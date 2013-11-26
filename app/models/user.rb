class User < ActiveRecord::Base
  has_many :issues
  has_many :responses

  def self.find_or_create_by_omniauth(auth)
    User.find_by(:provider => auth["provider"], :uid => auth["uid"]) || User.create_from_omniauth(auth)
  end

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
