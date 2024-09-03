class AddConfirmableToEmployer < ActiveRecord::Migration[7.1]
  def change
    add_column :employers, :confirmed_at, :datetime
    add_column :employers, :confirmation_token, :string
    add_column :employers, :confirmation_sent_at, :datetime
    add_column :employers, :unconfirmed_email, :string
  end
end
