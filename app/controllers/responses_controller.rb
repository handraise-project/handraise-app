class ResponsesController < ApplicationController

  def new
    @response = Response.new
    @issue_array = Issue.all.map { |issue| [issue.description, issue.id] }
  end
end
