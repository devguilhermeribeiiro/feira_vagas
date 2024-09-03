class ConfirmExistingJobSeekers < ActiveRecord::Migration[7.1]
  def up
    JobSeeker.update_all(confirmed_at: Time.current)
  end

  def down
    JobSeeker.update_all(confirmed_at: nil)
  end
end
