require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :first_name,:last_name, :email, :password, :admin, :password_confirmation

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :first_name,		:presence => true,
								:length => { :maximum => 25 }
	validates :last_name,		:presence => true,
								:length => { :maximum => 25 }
	validates :email,			:presence => true,
								:format => { :with => email_regex },
								:uniqueness => {:case_sensetive => false }
	validates :password,		:presence => true,
								:confirmation => true,
								:length => { :within => 6..40 }
	before_save :encrypt_password

	def has_password?(submitted_password)
		hashed_password == encrypt(submitted_password)
	end


	private
		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.hashed_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end

end
