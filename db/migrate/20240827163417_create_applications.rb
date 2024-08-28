# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.references :job, null: false, foreign_key: true
      t.references :job_seeker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
