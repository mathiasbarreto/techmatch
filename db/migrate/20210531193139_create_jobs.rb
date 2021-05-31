class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.date :start_date
      t.text :contractor_review
      t.float :contractor_rating
      t.text :employer_review
      t.float :employer_rating

      t.timestamps
    end
  end
end
