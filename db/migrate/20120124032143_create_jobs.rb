class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :application_id
      t.string :organization
      t.date :start_date
      t.date :end_date
      t.text :responsibilities

      t.timestamps
    end
  end
end
