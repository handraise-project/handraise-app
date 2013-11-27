class Course::IssuesController < ApplicationController
  before_action :set_course_and_issue
  before_action :set_course

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

  private
  def set_course_and_issue
    @issue = Issue.find_by(:id => params[:id])
    #@course = @issue.course
  end

  def set_course
    @course = Course.find_by(:id => params[:course_id])
  end

  def issue_params
    params.require(:issue).permit(:title,:description,:anonymous)
  end
end
