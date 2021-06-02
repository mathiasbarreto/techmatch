class AddFinishDateToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :finish_date, :date
  end
end
