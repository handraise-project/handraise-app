class AddFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :uid
      t.string :github_name
      t.string :provider
      t.string :email
      t.string :image_gravatar
    end
  end
end
