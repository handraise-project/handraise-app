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
    @user_notification = UserNotification.new
  end

  def create
    @issue = @course.add_issue(current_user, issue_params)

    @user_notification = @issue.user_notifications.build(:user_id => @issue.user_id, :issue_id => @issue.id).first

    binding.pry


    @user_notification.notify = params[:issue][:notify]

    
    # @user_notification = @issue.user_notifications.where(:user_id => @issue.user_id, :issue_id => @issue.id).first

    # @user_notification.notify = params[:issue][:notify]

    if @issue.save && @user_notification.save
      redirect_to @course, :notice => "Added the issue \"#{@issue.title}\""
    else
      render :new, :notice => "Oops, look like something went wrong :-/"
    end
  end

  def edit
  end

  def update
    @issue.update(issue_params)
    @user_notification = @issue.user_notifications.where(:user_id => @issue.user_id, :issue_id => @issue.id).first

    @user_notification.notify = params[:issue][:notify]

    if @issue.save && @user_notification.save
      redirect_to course_issue_path(@course, @issue), :notice => "Updated the issue: \"#{@issue.title}\""
    else
      render :edit, :notice => "Oops, looks like there was an error :-/"
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
