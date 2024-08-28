# frozen_string_literal: true

class RemoveProfileImageFromJobSeekers < ActiveRecord::Migration[7.1]
  def change
    remove_column :job_seekers, :profile_img, :string
  end
end
