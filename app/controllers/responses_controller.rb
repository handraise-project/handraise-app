class ResponsesController < ApplicationController
  before_filter :set_issue

  def create
    @response = @issue.add_response(current_user, response_params)

    if @response.save
      redirect_to course_issue_path(@issue.course, @issue), :notice => "Posted!"
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
