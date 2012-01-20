class AddDetailsToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :city, :string
    add_column :applications, :state, :string
    add_column :applications, :zip_code, :integer
    add_column :applications, :phone_number, :string
  end
end
