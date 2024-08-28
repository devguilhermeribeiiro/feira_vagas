class AddSiteFieldToEmployers < ActiveRecord::Migration[7.1]
  def change
    add_column :employers, :site, :string
  end
end
