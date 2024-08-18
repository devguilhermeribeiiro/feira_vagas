class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :descripton
      t.string :employer
      t.string :location
      t.string :mode

      t.timestamps
    end
  end
end
