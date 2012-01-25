class AddAnswerstoApplications < ActiveRecord::Migration
  def up
    add_column :applications, :answer1, :text
    add_column :applications, :answer2, :text
    add_column :applications, :answer3, :text
  end

  def down
  end
end
