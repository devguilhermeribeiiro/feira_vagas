# frozen_string_literal: true

class AddBenefitsToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :benefits, :text
  end
end
