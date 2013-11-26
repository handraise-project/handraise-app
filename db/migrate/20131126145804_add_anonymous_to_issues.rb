class AddAnonymousToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :anonymous, :boolean, default: false
  end
end
