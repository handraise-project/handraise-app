module UsersHelper

  def display_name(user)
    if user
      user.name || user.github_name
    end
  end

  def display_gravatar(user)
    if user.image_gravatar.blank?
      gravatar_image_tag('junk', :alt => 'Github Default Gravatar', :class => 'gravatar', :gravatar => { :default => :wavatar })
    else
      image_tag(current_user.image_gravatar, :alt => "#{current_user.name}", class:"gravatar")
    end
  end
end

 # <% if current_user.image_gravatar.blank? %>
 #      <%= gravatar_image_tag('junk', :alt => 'Github Default Gravatar', :class => 'gravatar', :gravatar => { :default => :wavatar }) %>
 #    <% else %>
 #       <%= image_tag(current_user.image_gravatar, :alt => "Gravatar", class:"gravatar") %>    
 #    <% end %>
