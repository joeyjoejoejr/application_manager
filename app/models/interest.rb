class Interest < ActiveRecord::Base
	has_many :interest_checkers
	has_many :applications, :through => :interest_checkers
end
