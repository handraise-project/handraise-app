require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the IssuesHelper. For example:
#
# describe IssuesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe IssuesHelper do

  it "shows anonymous when a post is anonymous" do
    issue = FactoryGirl.create(:user_issue)
    helper.stub(:current_user) { issue.user }
    expect(helper.issue_poster_name(issue)).to eq issue.user.name
  end

end
