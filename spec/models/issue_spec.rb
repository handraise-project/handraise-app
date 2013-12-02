require 'spec_helper'

describe Issue do

  context "associations" do 

    before :each do 
      @course = FactoryGirl.create(:course)
      @user = FactoryGirl.create(:user)
      @issue = @course.issues.build(:title => "My issue")
    end

    it "belongs to a course" do 
      expect(@course.issues.first).to eq @issue
    end

    it "has many responses" do 
      @response = @issue.add_response(@user, :description => "Stuff isn't working")
      @response.save
      expect(@issue.responses.first).to eq @response
    end
  end

  context do 
    it "can be added to a course" do 
      @course = FactoryGirl.create(:course)
      @user = FactoryGirl.create(:user)
      @issue = @course.add_issue(@user, {:title => "hello", :description => "Sup", :anonymous => :true})
      @issue.save

      expect(@course.issues.count).to eq 1
    end
  end

  context "an anonymous post" do 

    it "is not the default" do
      @issue = Issue.create(:title => "Hello") 
      expect(@issue.anonymous).to be false
    end

    it "can be explicity overwritten" do
      @issue = Issue.create(:anonymous => "true", :title => "Hello") 
      expect(@issue.anonymous).to be true
    end
  end

  context "resolution" do 
    before :each do 
      @issue = FactoryGirl.create(:issue)
    end

    it "is unresovled by default" do 
      expect(@issue.resolved?).to eq false
    end

    it "can be resolved" do 
      @issue.resolve!
      expect(@issue.resolved?).to eq true
    end
  end

end
