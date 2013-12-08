class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.boolean :notify, default: true
      t.integer :user_id
      t.integer :issue_id
    end
  end
end
