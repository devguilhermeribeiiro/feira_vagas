class AlterEmployerIdTypeOnJobs < ActiveRecord::Migration[7.1]
  def change
    change_column :jobs, :employer_id, 'integer USING CAST(employer_id AS integer)'
  end
end
