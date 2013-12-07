class IssueMailer < ActionMailer::Base
  default from: "help@iqueue.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.issue_mailer.new_reply.subject
  #
  def new_reply_notification(issue, response, current_user)
    @course_name_truncated = issue.course.name.split[0...2].join(' ')
    @issue_title = issue.title
    @response_content = response.description
    @recipient_email = current_user.email
    @recipient_first_name = current_user.name.split[0]
    @respondent = User.find(response.user_id)
    @respondent_name = @respondent.name
    @issue_link = course_issue_url(issue.course, issue)

    mail from: "Iqueue Notices <notices@iqueue.co>", to: "#{@recipient_email}", subject: "[#{@course_name_truncated}] New Reply to '#{@issue_title}'", :reply_to => "help@iqueue.co"
  end
end
