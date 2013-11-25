class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.integer :resolved, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
