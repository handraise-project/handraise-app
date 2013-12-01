module SiteHelper

  def users_for_select
    User.all.collect {|u| [ u.name, u.id ] }
  end
  
end
