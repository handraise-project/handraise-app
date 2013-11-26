class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :permissions, default: 0

      t.timestamps
    end
  end
end
