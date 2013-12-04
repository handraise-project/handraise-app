# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# # 2.times do
# #  FactoryGirl.create(:user, :permissions => 10)
# # end

# # 20.times do
# #  FactoryGirl.create(:issue)
# # end

# #<User id: 1, name: "Anders Ramsay", admin: false, created_at: "2013-11-29 19:08:07", updated_at: "2013-11-29 19:08:07", uid: "819213", github_name: "andersr", provider: "github", email: "andersr@gmail.com", image_gravatar: "https://2.gravatar.com/avatar/cb7a4cc2cff3810e8cc4b...">

def random_recent_past
   DateTime.now - rand(0..20130).minutes - rand(0..60).seconds
end

course1 = Course.create(:name => "Ruby 003 (Fall 2013)")
course2 = Course.create(:name => "iOS 000 (Fall 2013)")

student1 = FactoryGirl.create(:student)
student2 = FactoryGirl.create(:student)
student3 = FactoryGirl.create(:student)
student4 = FactoryGirl.create(:student)
student5 = FactoryGirl.create(:student)
student6 = FactoryGirl.create(:student)
student7 = FactoryGirl.create(:student)
student8 = FactoryGirl.create(:student)
student9 = FactoryGirl.create(:student)


instructor1 = FactoryGirl.create(:instructor)
instructor2 = FactoryGirl.create(:instructor)

issue1 = course1.issues.new
issue1.user_id = student1.id
issue1.title = "Pigeon Lab: Unexpected hash error in Sinatra"
issue1.description = <<-LONG_DESCRIPTION
We are working on the Pigeon lab and getting stuck on the following error:
<pre>
> NoMethodError: undefined method `[]' for nil:NilClass     from
> (irb):12:in `block in irb_binding'    from (irb):11:in `each'     from
> (irb):11
</pre>
LONG_DESCRIPTION
issue1.created_at = random_recent_past
issue1.save

issue2 = course1.issues.new
issue2.user_id = student2.id
issue2.anonymous = true
issue2.title = "rake db:migrate error"
issue2.description = <<-LONG_DESCRIPTION
I have been trying to run the rake db:migrate command and uninstalled and installed the gem we discussed in class, but no luck. This is the error I am getting:
<pre>
DEPRECATION WARNING: config.generators in Rails::Railtie is deprecated. Please use config.app_generators instead. (called from /Users/fayimora/Sites/rails_projects/sample_app/config/application.rb:12)
DEPRECATION WARNING: config.generators in Rails::Railtie is deprecated. Please use config.app_generators instead. (called from /Users/fayimora/Sites/rails_projects/sample_app/config/application.rb:12)
rake aborted!
undefined method `prerequisites' for nil:NilClass
/Users/fayimora/Sites/rails_projects/sample_app/Rakefile:7
(See full trace by running task with --trace)
</pre>
LONG_DESCRIPTION
issue2.created_at = random_recent_past
issue2.save

issue3 = course1.issues.new
issue3.user_id = student3.id
issue3.anonymous = true
issue3.title = "Rails: undefined method `+' for nil:NilClass"
issue3.description = <<-LONG_DESCRIPTION
This is my code:
<pre><% @something.each do |something| %>

<% i = i+1 %>

<% end %> </pre>

Any ideas what the issue might be?
LONG_DESCRIPTION
issue3.created_at = random_recent_past
issue3.save

issue4 = course1.issues.new
issue4.user_id = student4.id
issue4.title = "undefined method for nil class(?)"
issue4.description = <<-LONG_DESCRIPTION
I keep getting the above error message when trying to view data from my model in my view (the index page of my controller)

 My controller:
<pre>def index

 @recipe = Recipe.all

 end</pre>

 My view:
 <pre><% @recipes.each do |r| %>
   <tr><td><%= r.dish_name %></td></tr>
    <% end %></pre>
LONG_DESCRIPTION
issue4.created_at = random_recent_past
issue4.save

issue5 = course1.issues.new
issue5.user_id = student5.id
issue5.anonymous = true
issue5.title = "rails server keeps crashing"
issue5.created_at = random_recent_past
issue5.save

issue6 = course1.issues.new
issue6.user_id = student6.id
issue6.title = "completely stuck :-/"
issue6.created_at = random_recent_past
issue6.save

issue7 = course1.issues.new
issue7.user_id = student7.id
issue7.title = "sinatra routing errors"
issue7.created_at = random_recent_past
issue7.save
