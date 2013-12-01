class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def require_login
    redirect_to login_path unless current_user  
  end
 
  private

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_course
      @current_course ||= Course.first
  end
  helper_method :current_course

end
