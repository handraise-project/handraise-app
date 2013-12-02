class AddPrimaryCourseIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :primary_course_id, :integer
  end
end
