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

require 'spec_helper'

describe User do
  it "can be an admin" do 
    @user = FactoryGirl.create(:admin)
    expect(@user.admin).to be true
  end

  it "can be a non-admin" do 
    @user = FactoryGirl.create(:user)
    expect(@user.admin).to be false
  end
end
