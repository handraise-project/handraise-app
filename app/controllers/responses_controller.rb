class ResponsesController < ApplicationController
  before_filter :set_issue

  def create
    @response = @issue.add_response(current_user, response_params)

    #binding.pry
    notify_preference = @issue.user_notifications.where(:user_id => @issue.user_id, :issue_id => @issue.id).first.notify

    if @response.save
      if notify_preference == true
        IssueMailer.new_reply_notification(@issue, @response, current_user).deliver 
      end
      redirect_to course_issue_path(@issue.course, @issue), :notice => "Reply Posted!"
    else
      # TODO: error handling
    end
  end

  private

  def set_issue
    @issue = Issue.find_by(:id => params[:id])
  end

  def response_params
    params.require(:response).permit(:description)
  end

end
