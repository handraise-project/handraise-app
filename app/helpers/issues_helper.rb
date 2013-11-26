module IssuesHelper

  def issue_poster_name(issue)
    if current_user.admin?
      display_name(issue.user)
    elsif issue.anonymous
      "Anonymous"
    else
      display_name(issue.user)
    end
  end

  def can_see_resolve_button?(issue)
    !@issue.resolved? && (current_user == issue.user || current_user.admin?)
  end

end


