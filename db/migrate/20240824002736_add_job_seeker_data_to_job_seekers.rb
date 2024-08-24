class AddJobSeekerDataToJobSeekers < ActiveRecord::Migration[7.1]
  def change
    add_column :job_seekers, :phone, :string
  end
end
