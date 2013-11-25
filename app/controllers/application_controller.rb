class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  # def require_login
  #   current_user  
  # end

  private

    def current_user

      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end
