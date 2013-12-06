class AddTimeAsWordsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :time_as_words, :string
  end
end
