require 'spec_helper'

describe CoursesController do

  before :each do 
    user = FactoryGirl.create(:user)
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  context "creation" do 
    before :each do 
      post :create, :course => {:name => "My course name"}
    end

    it "creates a new course" do 
      expect(response.code).to eq "302"
    end

    it "redirects to the correct course" do 
      expect(response).to redirect_to assigns[:course]
    end

  end

  it "shows courses" do 
    course = Course.create(:name => "My course")
    get 'show', id: 1
    expect(response.code).to eq "200"
  end
end
