class SiteController < ApplicationController
  skip_before_filter :require_login

  def start
  end
  
  def new_admin
  end

  def create_admin
    user = User.find(params["user"]["user"])
    user.admin = true
    redirect_to '/'
  end

end
