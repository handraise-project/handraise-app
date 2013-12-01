set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}


every 1.day, :at => '4:00 am' do
  rake "issues:archive"
end