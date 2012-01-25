# == Schema Information
#
# Table name: interests
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Interest < ActiveRecord::Base
	has_many :interest_checkers
	has_many :applications, :through => :interest_checkers
end
