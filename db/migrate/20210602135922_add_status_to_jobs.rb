class AddStatusToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_done, :boolean
  end
end
