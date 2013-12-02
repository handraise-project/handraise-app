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

# def random_recent_past
#    DateTime.now - rand(0..40).minutes - rand(0..60).seconds
# end

# course = Course.create(:name => "Ruby 003")

# student1 = FactoryGirl.create(:student)
# student2 = FactoryGirl.create(:student)
# student3 = FactoryGirl.create(:student)
# # instructor1 = FactoryGirl.create(:instructor)
# # instructor2 = FactoryGirl.create(:instructor)


# issue1 = FactoryGirl.build(:issue)
# issue1.user_id = student1.id
# issue1.title = "rails s keeps crashing"
# issue1.description = "For some reason, 'rails s' keeps crashing when we run it.  We're totally new to Rails so no idea what's going on :-/"
# issue1.created_at = random_recent_past
# issue1.save


# issue2 = FactoryGirl.build(:anonymous_issue)
# issue2.user_id = student2.id
# issue2.title = "Rake db:migrate errors"
# issue2.description = "We get the follwing error when running rake db:migrate
# Rake Aborted!
# Uninitialized constant Bundler
# We looked at this Stackoverflow article, but it didn't solve the problem:
# http://stackoverflow.com/questions/5605522/ruby-on-rails-rake-dbmigrate-produces-error-rake-aborted-uninitialized-con"
# issue2.created_at = random_recent_past
# issue2.save

# issue3 = FactoryGirl.build(:issue)
# issue3.user_id = student3.id
# issue3.title = "undefined method `permissions=' when trying to run rake db:seed"
# issue3.description = <<-END_LONG_DESCRIPTION
#   this is the output we're getting:
#   rake db:seed --trace ** Invoke db:seed (first_time)
#   ** Execute db:seed
#   ** Invoke db:abort_if_pending_migrations (first_time)
#   ** Invoke environment (first_time)
#   ** Execute environment
#   ** Execute db:abort_if_pending_migrations
#   rake aborted!
#   undefined method `permissions=' for #<User:0x007fb742799ec8>
# END_LONG_DESCRIPTION
# issue3.created_at = random_recent_past
# issue3.save

# issue3 = FactoryGirl.build(:anonymous_issue)
# issue3.user_id = student3.id
# issue3.title = "Sinatra routing error"
# issue3.description = <<-END_LONG_DESCRIPTION
# I have just setup Sinatra v1.1.0 inside my rails (v3.0.1) app. But I can't invoke any routes that are more than 1 level deep.
# This works - http://localhost/customer/3
# But this one does not work - http://localhost/customer/3/edit and I get a "Routing Error"
# END_LONG_DESCRIPTION
# issue3.created_at = random_recent_past
# issue3.save