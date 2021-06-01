class AddSkillsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :skills, :text
  end
end
