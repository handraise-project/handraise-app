module Course::IssuesHelper

  def issue_poster_name(issue)
    if current_user.admin || issue.user == current_user
      display_name(issue.user)
    elsif issue.anonymous
      "Anonymous"
    else
      display_name(issue.user)
    end
  end

  def can_see_resolve_button?(issue)
    !issue.resolved? && !issue.archived? && (current_user == issue.user || current_user.admin)
  end

  def issue_name_and_time_ago(issue)
    content_tag(:li, "#{issue_poster_name(issue)}, #{time_ago_in_words(issue.created_at, seconds: true)} ago")
  end

  def time_words(issue_time)
    diff_seconds = Time.now - issue_time
    case diff_seconds
      when 0 .. 59
        puts "#{diff_seconds} seconds ago"
      when 60 .. (3600-1)
        puts "#{diff_seconds/60} minutes ago"
      when 3600 .. (3600*24-1)
        puts "#{diff_seconds/3600} hours ago"
      when (3600*24) .. (3600*24*30) 
        puts "#{diff_seconds/(3600*24)} days ago"
      else
        puts issue_time.strftime("%m/%d/%Y")
    end
  end


  def added_to_instructor_queue(issue)
    if issue.instructor_id && current_user.id != issue.instructor_id
      instructor = User.find(issue.instructor_id)
      content_tag(:li, "In #{instructor.name}'s Queue")
    end
  end

end
