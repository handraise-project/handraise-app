# Load the Rails application.
require File.expand_path('../application', __FILE__)

GITHUB_LOCALHOST_CLIENT_ID = ENV['GITHUB_LOCALHOST_CLIENT_ID']
GITHUB_LOCALHOST_CLIENT_SECRET = ENV['GITHUB_LOCALHOST_CLIENT_SECRET']

# Initialize the Rails application.
Handraise::Application.initialize!
