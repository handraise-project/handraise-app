require "spec_helper"

describe IssueMailer do
  describe "new_reply" do
    let(:mail) { IssueMailer.new_reply }

    it "renders the headers" do
      mail.subject.should eq("New reply")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
