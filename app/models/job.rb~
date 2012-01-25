# == Schema Information
#
# Table name: jobs
#
#  id               :integer         not null, primary key
#  application_id   :integer
#  organization     :string(255)
#  start_date       :date
#  end_date         :date
#  responsibilities :text
#  created_at       :datetime
#  updated_at       :datetime
#

class Job < ActiveRecord::Base
  belongs_to :application
end
