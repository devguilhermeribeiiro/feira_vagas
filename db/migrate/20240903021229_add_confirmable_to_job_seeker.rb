class AddConfirmableToJobSeeker < ActiveRecord::Migration[7.1]
  def change
    add_column :job_seekers, :confirmed_at, :datetime
    add_column :job_seekers, :confirmation_token, :string
    add_column :job_seekers, :confirmation_sent_at, :datetime
    add_column :job_seekers, :unconfirmed_email, :string
  end
end
