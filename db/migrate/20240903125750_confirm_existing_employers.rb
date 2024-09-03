class ConfirmExistingEmployers < ActiveRecord::Migration[7.1]
  def up
    Employer.update_all(confirmed_at: Time.current)
  end

  def down
    Employer.update_all(confirmed_at: nil)
  end
end
