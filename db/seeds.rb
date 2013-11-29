# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 2.times do
#  FactoryGirl.create(:user, :permissions => 10)
# end

# 20.times do
#  FactoryGirl.create(:issue)
# end

#<User id: 1, name: "Anders Ramsay", admin: false, created_at: "2013-11-29 19:08:07", updated_at: "2013-11-29 19:08:07", uid: "819213", github_name: "andersr", provider: "github", email: "andersr@gmail.com", image_gravatar: "https://2.gravatar.com/avatar/cb7a4cc2cff3810e8cc4b...">

course = Course.create(:name => "Ruby 003")

student1 = FactoryGirl.create(:student)
student2 = FactoryGirl.create(:student)
# instructor1 = FactoryGirl.create(:instructor)
# instructor2 = FactoryGirl.create(:instructor)


issue1 = FactoryGirl.build(:issue)
issue1.user_id = student1.id
issue1.anonymous = true
issue1.title = "rails s keeps crashing"
issue1.description = "For some reason, 'rails s' keeps crashing when we run it.  We're totally new to Rails so no idea what's going on :-/"
issue1.save


issue2 = FactoryGirl.build(:issue)
issue2.user_id = student2.id
issue2.anonymous = true
issue2.title = "Rake db:migrate errors"
issue2.description = "We get the follwing error when running rake db:migrate
Rake Aborted!
Uninitialized constant Bundler
We looked at this Stackoverflow article, but it didn't solve the problem:
http://stackoverflow.com/questions/5605522/ruby-on-rails-rake-dbmigrate-produces-error-rake-aborted-uninitialized-con"
issue2.save

#additional issues:
# rake aborted!
#undefined method `permissions='
# when trying to run rake db:seed
# this is the output we're getting:
#   rake db:seed --trace
# ** Invoke db:seed (first_time)
# ** Execute db:seed
# ** Invoke db:abort_if_pending_migrations (first_time)
# ** Invoke environment (first_time)
# ** Execute environment
# ** Execute db:abort_if_pending_migrations
# rake aborted!
# undefined method `permissions=' for #<User:0x007fb742799ec8>
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activemodel-4.0.1/lib/active_model/attribute_methods.rb:439:in `method_missing'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activerecord-4.0.1/lib/active_record/attribute_methods.rb:155:in `method_missing'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/attribute_assigner.rb:16:in `block (2 levels) in object'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/attribute_assigner.rb:15:in `each'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/attribute_assigner.rb:15:in `block in object'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/attribute_assigner.rb:14:in `tap'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/attribute_assigner.rb:14:in `object'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/evaluation.rb:12:in `object'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/strategy/create.rb:9:in `result'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/factory.rb:42:in `run'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/factory_runner.rb:23:in `block in run'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activesupport-4.0.1/lib/active_support/notifications.rb:161:in `instrument'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/factory_runner.rb:22:in `run'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/factory_girl-4.3.0/lib/factory_girl/strategy_syntax_method_registrar.rb:20:in `block in define_singular_strategy_method'
# /Users/Anders/Dropbox/WWW/flatiron/projects/handraise-app/db/seeds.rb:19:in `<top (required)>'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activesupport-4.0.1/lib/active_support/dependencies.rb:223:in `load'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activesupport-4.0.1/lib/active_support/dependencies.rb:223:in `block in load'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activesupport-4.0.1/lib/active_support/dependencies.rb:214:in `load_dependency'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activesupport-4.0.1/lib/active_support/dependencies.rb:223:in `load'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/railties-4.0.1/lib/rails/engine.rb:540:in `load_seed'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activerecord-4.0.1/lib/active_record/tasks/database_tasks.rb:154:in `load_seed'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/activerecord-4.0.1/lib/active_record/railties/databases.rake:181:in `block (2 levels) in <top (required)>'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:236:in `call'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:236:in `block in execute'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:231:in `each'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:231:in `execute'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:175:in `block in invoke_with_call_chain'
# /Users/Anders/.rvm/rubies/ruby-2.0.0-p247/lib/ruby/2.0.0/monitor.rb:211:in `mon_synchronize'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:168:in `invoke_with_call_chain'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/task.rb:161:in `invoke'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:149:in `invoke_task'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:106:in `block (2 levels) in top_level'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:106:in `each'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:106:in `block in top_level'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:115:in `run_with_threads'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:100:in `top_level'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:78:in `block in run'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:165:in `standard_exception_handling'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/lib/rake/application.rb:75:in `run'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/gems/rake-10.1.0/bin/rake:33:in `<top (required)>'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/bin/rake:23:in `load'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/bin/rake:23:in `<main>'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/bin/ruby_executable_hooks:15:in `eval'
# /Users/Anders/.rvm/gems/ruby-2.0.0-p247/bin/ruby_executable_hooks:15:in `<main>'
# Tasks: TOP => db:seed


# Issue id: nil, description: nil, resolved: 0, user_id: nil, created_at: nil, updated_at: nil, title: nil, anonymous: false, course_id: nil