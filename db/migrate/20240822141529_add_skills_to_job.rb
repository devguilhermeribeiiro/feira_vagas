class AddSkillsToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :skills, :text
  end
end
