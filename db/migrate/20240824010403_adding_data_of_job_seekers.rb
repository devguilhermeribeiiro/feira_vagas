class AddingDataOfJobSeekers < ActiveRecord::Migration[7.1]
  def change
    add_column :job_seekers, :degree, :string
    add_column :job_seekers, :courses, :text
    add_column :job_seekers, :experiences, :text
  end
end
