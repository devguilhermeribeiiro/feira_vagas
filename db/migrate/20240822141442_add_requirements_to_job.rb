class AddRequirementsToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :requirements, :text
  end
end
