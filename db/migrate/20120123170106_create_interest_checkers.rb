class CreateInterestCheckers < ActiveRecord::Migration
  def change
    create_table :interest_checkers do |t|
      t.integer :interest_id
      t.integer :application_id

      t.timestamps
    end
  end
end
