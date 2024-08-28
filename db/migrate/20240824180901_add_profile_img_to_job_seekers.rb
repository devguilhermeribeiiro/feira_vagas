# frozen_string_literal: true

class AddProfileImgToJobSeekers < ActiveRecord::Migration[7.1]
  def change
    add_column :job_seekers, :profile_img, :string
  end
end
