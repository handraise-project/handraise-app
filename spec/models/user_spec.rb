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
