class IssuesController < ApplicationController
  before_action :set_issue, :only => [:edit, :update, :show, :resolved]

  def index
    #TODO: eager load this
#    @issues = Issue.all

    @unresolved_issues = Issue.where("resolved = 0")
    @resolved_issues = Issue.where("resolved = 1")
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    
    if @issue.save
      redirect_to issues_path, :notice => "Posted!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @issue.update(issue_params)
    @issue.save
    redirect_to @issue
  end

  def show
  end

  def resolved
    @issue.resolved = 1
    @issue.save
    redirect_to issues_path, :notice => "Resolved!"
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end


  def issue_params
    params.require(:issue).permit(:description)  
  end

end
