class AddArchivedToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :archived, :boolean, default: false
  end
end
