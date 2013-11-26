module ApplicationHelper

  def current_user_name
    current_user.name || current_user.github_name
  end
end
