class AddNotifyToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :notify, :boolean
  end
end
