class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.string :address

      t.timestamps
    end
    add_index :applications, [:user_id, :created_at]
  end
end
