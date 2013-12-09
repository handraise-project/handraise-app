class IssueMailer < ActionMailer::Base
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper

  default from: "help@iqueue.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.issue_mailer.new_reply.subject
  #
 # add_links = auto_link(text, :sanitize => false)
 #    add_formatting = simple_format(add_links, {}, :sanitize => false).html_safe 


  def new_reply_notification(issue, response, current_user)
    @course_name_truncated = issue.course.name.split[0...2].join(' ')
    @issue_title = issue.title
    @response_content_html = simple_format(response.description, {}, :sanitize => false).html_safe
    @response_content_plain_text = strip_tags(response.description)
    @recipient = User.find(issue.user_id)
    @recipient_email = @recipient.email
    @recipient_first_name = @recipient.name.split[0]
    @respondent = User.find(response.user_id)
    
    if @respondent.admin
      @respondent_name = "#{@respondent.name} (Instructor)"
    else
      @respondent_name = @respondent.name
    end
    
    @issue_link = course_issue_url(issue.course, issue)

    mail from: "Iqueue Notices <notices@iqueue.co>", to: "#{@recipient_email}", subject: "[#{@course_name_truncated}] New Reply to '#{@issue_title}'", :reply_to => "help@iqueue.co"
  end
end
