class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :first_name,:last_name, :email, :password, :admin

	validates :password,		:presence => true,
								:confirmation => true
end
