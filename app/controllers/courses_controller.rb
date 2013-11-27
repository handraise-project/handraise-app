class CoursesController < ApplicationController
  before_filter :set_course, only: [:show, :edit, :update]

  def index
    @courses = Course.all
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
    @unresolved_issues = @course.issues.where("resolved = 0")
    @resolved_issues = @course.issues.where("resolved = 1")
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

  private
  def set_course
    @course = Course.find_by(:id => params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end

end
