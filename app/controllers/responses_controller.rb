class ResponsesController < ApplicationController
  before_filter :set_issue

  def create
    @response = @issue.add_response(current_user, response_params)

    if @response.save
      if @issue.notify == 1 || @issue.notify == true
        IssueMailer.new_reply_notification(@issue, @response, current_user).deliver 
      end
      redirect_to course_issue_path(@issue.course, @issue), :notice => "Reply Posted!"
    else
      redirect_to course_issue_path(@issue.course, @issue), :notice => "Oops, looks like something went wrong :-/"
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
