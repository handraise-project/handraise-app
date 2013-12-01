namespace :issues do
  desc "Archive Old Issues"
  task :archive => :environment do
    todays = Issue.where(archived: false)
    todays.each do |issue|
      issue.archived = true
      issue.save
    end
  end
end