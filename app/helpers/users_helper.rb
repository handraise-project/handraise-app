module UsersHelper

  def display_name(user)
    user.name || user.github_name
  end
end
