# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  admin             :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#  uid               :string(255)
#  github_name       :string(255)
#  provider          :string(255)
#  email             :string(255)
#  image_gravatar    :string(255)
#  primary_course_id :integer
#

class User < ActiveRecord::Base
  has_many :issues
  has_many :responses
  has_many :user_notifications

  #listed by their github username
  #TODO: move this into db and/or more secure/robust solution
  COURSE_INSTRUCTORS = [
    "ruby-bob-003",
    "jongrover",
    "spencer1248",
    "scottcreynolds",
    "aviflombaum"
  ]

  

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
      user.admin = true if User::COURSE_INSTRUCTORS.include? auth["info"]["nickname"]
    end
  end 

  def display_name
    self.name || self.github_name
  end
  
end
