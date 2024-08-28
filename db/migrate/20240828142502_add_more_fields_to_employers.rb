class AddMoreFieldsToEmployers < ActiveRecord::Migration[7.1]
  def change
    add_column :employers, :phone, :string
    add_column :employers, :location, :string
  end
end
