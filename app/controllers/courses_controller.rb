class CoursesController < ApplicationController
  before_filter :set_course, only: [:show, :edit, :update, :add_to_queue, :remove_from_queue, :show_archive]

  def index
    if current_user.primary_course_id
      @course = Course.find_by(:id => current_user.primary_course_id)
      redirect_to @course
    else
      @courses = Course.all
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, :notice => "Created!"
    else
      render :new
    end
  end

  def show
    @unresolved_issues = @course.issues.unresolved
    @resolved_issues = @course.issues.resolved.not_archived
    @instructor_queue = Issue.in_instructor_queue(current_user)
  end

  def edit
  end

  def update
    @course.update(course_params)
    if @course.save
      redirect_to @course, :notice => "Edited!"
    else
      render :edit
    end
  end

  def add_primary_course
    @course = Course.find_by(:id => params["course_id"])
    current_user.primary_course_id = params["course_id"]
    current_user.save
    redirect_to @course, :notice => "Primary Course Saved!"
  end

  def remove_primary_course
    @course = Course.find_by(:id => params["course_id"])
    current_user.primary_course_id = nil
    current_user.save
    redirect_to @course, :notice => "Primary Course Removed..."
  end

  def show_archive
    @course = Course.find_by(id: params["course_id"])
    @archived_issues = Issue.where(course_id: params["course_id"]).where(archived: true)
  end

  private
  def set_course
    @course = Course.find_by(:id => params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

end
