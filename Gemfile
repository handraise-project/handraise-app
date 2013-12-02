source 'https://rubygems.org'
gem 'rails', '4.0.1'

group :production do
  gem 'pg'
end        

group :development, :test do
  gem 'sqlite3', '1.3.8'
end

gem 'rails_12factor', group: :production
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'dotenv-rails'
gem 'faker'
gem 'jquery-rails'
gem 'rails_autolink'
gem 'whenever', :require => false
gem 'octokit'
gem 'omniauth-github', :git => 'git://github.com/intridea/omniauth-github.git'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', :github => 'anjlab/bootstrap-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
  gem "rspec-rails"
  gem "capybara"
  gem "selenium-webdriver"
  gem "better_errors"
  gem "binding_of_caller"
  gem "terminal-notifier-guard"
  gem "factory_girl_rails"
  gem "simplecov"
  gem "database_cleaner"
  gem "guard", ">=2.1.0"
  gem "guard-rspec"
  gem "pry"
  gem "meta_request"
  gem 'annotate', ">=2.5.0"
end

ruby "2.0.0"