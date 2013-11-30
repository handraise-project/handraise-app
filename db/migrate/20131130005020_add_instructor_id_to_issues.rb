class AddInstructorIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :instructor_id, :integer
  end
end
