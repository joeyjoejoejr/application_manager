class AddIndexToInterestChecker < ActiveRecord::Migration
  def change
    add_index :interest_checkers, [:interest_id, :application_id]
    add_index :jobs, :application_id 
    add_index :schools, :application_id 
  end
end
