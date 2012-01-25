class AddInterestUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :interests, :name, :unique => true
  end

  def self.down
    remove_index :interests, :name
  end
end
