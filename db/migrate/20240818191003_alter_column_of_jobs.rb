class AlterColumnOfJobs < ActiveRecord::Migration[7.1]
  def change
    rename_column :jobs, :descripton, :description
  end
end
