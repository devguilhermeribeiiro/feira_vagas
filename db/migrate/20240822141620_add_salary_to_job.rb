# frozen_string_literal: true

class AddSalaryToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :salary, :text
  end
end
