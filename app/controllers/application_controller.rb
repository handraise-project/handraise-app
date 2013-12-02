class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  http_basic_authenticate_with name: "flatiron", password: "33west26"

  def require_login
    redirect_to login_path unless 
    current_user  
  end
 
  private

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end