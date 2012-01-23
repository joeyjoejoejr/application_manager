class InterestChecker < ActiveRecord::Base
	belongs_to :interest
	belongs_to :application
end
