class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :type
      t.string :name
      t.string :major
      t.string :degree
      t.date :date_recieved
      t.integer :application_id

      t.timestamps
    end
  end
end
