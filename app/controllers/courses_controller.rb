  class CoursesController < ApplicationController
  before_filter :set_course, only: [:show, :edit, :update, :add_to_queue, :remove_from_queue, :show_archive, :refresh]

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
    if current_user.admin
      @unresolved_issues = @course.issues.order('created_at DESC').unresolved.not_queued
      @instructor_queue = @course.issues.order('created_at DESC').in_instructor_queue(current_user).unresolved.not_archived
    else
      @unresolved_issues = @course.issues.order('created_at DESC').unresolved
    end

    @resolved_issues = @course.issues.order('created_at DESC').resolved.not_archived
    
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

  def refresh
    if current_user.admin = true
     @course = Course.find(params["course_id"])
     @issues = Issue.where(course_id: @course.id)
     render json: @course.issues.to_json(include: [:user, :responses])
    end

  end

  private

  def json_hash
    #returns a hash with all the shit we want to go to javascript.
  end

  def set_course
    @course = Course.find_by(:id => params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

end
