class AddFullNameToJobSeekers < ActiveRecord::Migration[7.1]
  def change
    add_column :job_seekers, :full_name, :string
  end
end
