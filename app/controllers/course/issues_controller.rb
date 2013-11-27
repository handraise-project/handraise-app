class Course::IssuesController < ApplicationController
  before_action :set_course
  before_action :set_issue, except: [:new]

  def show
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    @issue.course = @course

    if @issue.save
      redirect_to @course, :notice => "Added an issue!"
    else
      render :new, :notice => "Errors!"
    end
  end

  def edit
  end

  def update
    @issue.update(issue_params)

    if @issue.save
      redirect_to course_issue_path(@course, @issue), :notice => "Updated"
    else
      render :edit, :notice => "Error"
    end
  end

  def resolve
    @issue.update(:resolved => 1)
    @issue.save
    redirect_to @course, :notice => "Resolved!"
  end

  private
  def set_issue
    @issue = Issue.find_by(:id => params[:id])
  end

  def set_course
    @course = Course.find_by(:id => params[:course_id])
  end

  def issue_params
    params.require(:issue).permit(:title,:description,:anonymous)
  end
end
