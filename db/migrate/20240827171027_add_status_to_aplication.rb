class AddStatusToAplication < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :status, :boolean, default: false
  end
end
