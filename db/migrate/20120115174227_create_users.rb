class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
t.column :first_name, :string
      t.column :last_name, :string
      t.column :admin, :boolean
      t.column :email, :string
      t.column :hashed_password, :string
      t.column :salt, :string
      t.timestamps
    end
  end
end
