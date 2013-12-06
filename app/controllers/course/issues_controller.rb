class Course::IssuesController < ApplicationController
  before_action :set_course
  before_action :set_issue, except: [:new, :create]

  def show
    # if @issue.instructor_id
    #   @remove_from_queue
    # else
    #   @add_to_queue
    # end
    @response = Response.new
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = @course.add_issue(current_user, issue_params)

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
    @issue.resolve!
    redirect_to @course, :notice => "Resolved!"
  end

  def add_to_queue
      @issue.instructor_id = current_user.id
      @issue.save 
    redirect_to @course, :notice => "Added to #{current_user.name}'s queue"
  end

  def remove_from_queue
      @issue.instructor_id = nil
      @issue.save 
    redirect_to @course, :notice => "Issue removed from #{current_user.name}'s queue"
  end

  def queue_item
    @issue.instructor_id = current_user.id
    @issue.save
   
    # @course.issues.in_instructor_queue(current_user).each do |issue|
    #   issue.created_at
    # end
    
    # json_issue = 
      render json: @course.issues.in_instructor_queue(current_user).not_archived.unresolved.to_json(include: :user) 
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
