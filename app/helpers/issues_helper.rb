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
end
