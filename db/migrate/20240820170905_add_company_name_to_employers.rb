# frozen_string_literal: true

class AddCompanyNameToEmployers < ActiveRecord::Migration[7.1]
  def change
    add_column :employers, :company_name, :string
  end
end
