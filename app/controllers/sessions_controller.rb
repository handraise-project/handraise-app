class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
    render layout: "login"
  end

  def create
    user = User.find_or_create_by_omniauth(auth_hash)

    if user 
      session[:user_id] = user.id
      session[:token] = auth_hash[:credentials][:token]
      redirect_to courses_path, notice: "Signed in"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:token] = nil
    redirect_to login_path, notice: "Signed out."
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
