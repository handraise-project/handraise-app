class AddCourseIdToIssue < ActiveRecord::Migration
  def change
    add_reference :issues, :course, index: true
  end
end
