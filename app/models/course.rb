class Course < ActiveRecord::Base
  has_many :issues
  has_many :responses, :through => :issues
end
