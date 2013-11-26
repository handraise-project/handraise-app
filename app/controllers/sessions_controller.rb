class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new

  end

  def create
    if !current_user
      user = User.create_from_omniauth(auth_hash)
      session[:user_id] = user.id
      session[:token] = auth_hash[:credentials][:token]
      redirect_to issues_path, notice: "Signed in"
    else
      redirect_to issues_path, notice: "Welcome back!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Signed out."
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
