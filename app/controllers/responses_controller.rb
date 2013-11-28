class ResponsesController < ApplicationController

  def create
    @issue = Issue.find(params[:issue_id])
    @response = @issue.responses.build(response_params) 
    @response.user = current_user if current_user

    if @response.save
      redirect_to issue_path(@issue), :notice => "Posted!"
    else
      render :new
    end
  end

  # def create
  #   @issue = Issue.new(issue_params)
  #   @issue.user = current_user
    
  #   if @issue.save
  #     redirect_to issues_path, :notice => "Posted!"
  #   else
  #     render :new
  #   end
  # end


  private
  def response_params
    params.require(:response).permit(:description)
  end


end
