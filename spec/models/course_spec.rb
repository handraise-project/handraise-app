# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Course do

  before :each do 
    @course = FactoryGirl.create(:course)
  end

  it "has a name" do 
    expect(Course.find_by(:name => "Flatiron Ruby 003")).to eq @course
  end

  it "has issues" do 
    @issue = @course.issues.build(:title => " ")
    expect(@course.issues.first).to eq @issue
  end
end
