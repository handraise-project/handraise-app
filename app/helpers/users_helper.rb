module UsersHelper

  def display_name(user)
    if user
      user.name || user.github_name
    end
  end

  def display_gravatar(user)
    if user.image_gravatar.blank?
      gravatar_image_tag("#{user.email}", :alt => "#{user.name}", :class => 'gravatar', :gravatar => { :default => :wavatar })
    else
      image_tag(user.image_gravatar, :alt => 'user.name', :class => "gravatar")
    end
  end
end
