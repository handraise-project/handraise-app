class SiteController < ApplicationController
    skip_before_filter :require_login

  def start
  end
  
end
