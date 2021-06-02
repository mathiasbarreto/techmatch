class AddProfileSummaryToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_summary, :text
  end
end
