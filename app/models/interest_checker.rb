# == Schema Information
#
# Table name: interest_checkers
#
#  id             :integer         not null, primary key
#  interest_id    :integer
#  application_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class InterestChecker < ActiveRecord::Base
	belongs_to :interest
	belongs_to :application
end
