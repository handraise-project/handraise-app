class IssuesController < ApplicationController

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
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update(issue_params)
    @issue.save
    redirect_to @issue
  end

  def show
    @issue = Issue.find_by(:id => params[:id])
  end

  def resolve
    @issue = Issue.find(params[:id])
    @issue.resolved = 1
    @issue.save
    redirect_to issues_path, :notice => "Resolved!"
  end

  private
  def issue_params
    params.require(:issue).permit(:description)  
  end

end
