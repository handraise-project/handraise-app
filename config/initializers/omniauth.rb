OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_LOCALHOST_CLIENT_ID'], ENV['GITHUB_LOCALHOST_CLIENT_SECRET'], scope: "user", redirect_uri: '/auth/github/callback'
end 